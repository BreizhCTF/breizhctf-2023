# Intégration continue avec gitlab

## Objectif attendu

L'objectif est de créer une pipeline gitlab qui répond au besoin suivant :
- La pipeline doit build toutes les images docker sans avoir à rajouter la configuration manuellement
- La pipeline doit mettre à jour l'environnement de test
- La pipeline doit mettre à jour le CTFd en se basant sur les fichiers `challenge.yml`

## Quand est-ce que la pipeline doit tourner ?

La pipeline tourne systématiquement lorsque qu'il y a de nouveau commits sur la branche principale.

Lorsque que de nouveaux commits arrivent sur d'autres branches, la pipeline tourne uniquement
lorsqu'une merge request est ouverte. On utilise alors l'avantage des[pipeline for merged results](https://docs.gitlab.com/ee/ci/pipelines/merged_results_pipelines.html) (disponible uniquement sur Gitlab Premium).

## Description des différents job

### 1. __Generate docker jobs__

Cette tâche fait appel à un [script bash](../ci/scripts/gen_docker_builds.sh) pour générer d'autres
jobs gitlab. Ce script itère parmi tous les challenges à la recherche de fichier sous la forme
`(.*\.)Dockerfile` et génère un nouveau job pour chaque fichier trouvé.

Pour limiter le nombre d'éxecution inutiles des jobs, des `rules` sont utilisés pour les lancer
uniquement si les fichiers des challenges ont étés modifiés.

Aussi, pour garder toutes les images à jour avec leur image de base, tous les images qui dépendent
d'image de base sont rebuild dès que leur image de base est modifié.

La tâche produit [un artefact](https://docs.gitlab.com/ee/ci/pipelines/job_artifacts.html) qui
contient tous les nouveaux jobs à lancer. 

### 2. __Run jobs__

Cette tâche utilise l'artefact produit par le job *"Generate docker jobs"* pour démarer une 
sous-pipeline qui lancera tous les nouveaux jobs spécifiés dans l'artefact. Ce système de
sous-pipeline permet de générer dynamiquement les nouveaux jobs dès qu'un nouveau challange est
ajouté, et ce sans avoir à modifier le `.gitlab-ci.yml`.

### 3. __Deploy dev environment__

Cette tâche fait appel à pulumi pour déployer les challenges sur l'infrastructure. La variable
d'environnement `$KUBECONFIG_FILE` est nécessaire pour se connecter au cluster Kubernetes.

### 4. __Configure CTFd__

Cette tâche utilise le script [configure_ctfd.py](../ci/scripts/configure_ctfd.py) pour synchroniser
les fichiers `challenge.yml` avec l'instance CTFd. Le script utilise
[CTFCli](https://github.com/CTFd/ctfcli) pour synchroniser les challenge.

La variable d'environnement `$CTFCLI_CONFIG` est nécessaire pour se connecter au CTFd avec un token
administrateur.
