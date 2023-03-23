# Breizh CTF 2023 - Infrastructure

Ce dépôt contient toute la config "Infra As Code" utilisé pour déployer le Breizh CTF.

> Attention, si vous cherchez à rejouer les challenges en local, il vaut mieux build et lancer
> les conteneurs de chaque challenge à la main.
> Ce dossier `infra` a plus vocation à documenter la manière dont l'infra de prod à été montée.
> En tentant de faire déployer les challenges via ce dossier sans connaissances en kubernetes ou
> dans pulumi, vous perdrez plus de temps qu'autre chose.

Tout ce dépôt se base sur le fait que vous avez déjà un cluster kubernetes, avec idéalement un
load balancer sur les ports 80 et >= 30002.

## Challenge dynamique vs challenge statiques

Les challenges dit "statiques" sont des challenges disponibles de manière commune à tous les joueurs. Ces challenges sont déployés et scale pour supporter la charge.

Les challenges "dynamiques" ou "à la demande" sont des challenges qui ne sont pas déployés immédiatement. À la place, les manifestes yaml sont générés et stockés dans une CRD `isolated-challenges`. Cette CRD sera utilisée par le challenge manager pour déployer une instance dédiée lorsqu’un joueur le demande.

> Pour plus d'informations sur les challenges à la demande, se référer au dépôt [breizhctf-manager-2023](https://github.com/BreizhCTF/breizhctf-manager-2023)

## Description de l'architecture

Tous les composants réutilisables se trouvent dans le dossier `components`, on y retrouve :
- `namespace.component.ts` qui se créer un namespace dédié pour héberger une liste de challenges
- `challenge.component.ts` qui se charge de déployer l'intégralité d'un challenge (deployment + service + network policy + ingress) à partir de la conf d'un challenge
- `challengeManager.component.ts` qui déploie le challenge manager pour les challenges à la demande
- `ctfd.component.ts` qui déploie un CTFd à peu près production-ready, mais qui n'est pas utilisé pour la prod


## Prérequis

- [Pulumi runtime](https://www.pulumi.com/docs/get-started/install/)
- Node.JS (+ yarn recommandé)
- Un cluster kubernetes déjà déployé
  - Un load balancer, traefik est recommandé (les annotations des services sont préparées pour traefik)
  - Assurez-vous que vos "network policies" fonctionne (ex. k3s a un système de network policies merdiques de base)
  - Avoir installé la CRD
- L'intégralité des images docker sur un registry docker (publique ou privé)

## Configuration

1. Se connecter sur votre compte pulumi (vous pouvez aussi utiliser le backend local, mais je n'ai jamais testé)
2. Créer une nouvelle stack : `pulumi stack init <nom de la stack>`
3. Définir la configuration liée à votre stack :
   1. `pulumi config set namespace ...` : Nom du namespace dans lequel vous voulez héberger les challenges
   2. `pulumi config set challengeManagerImage ...` : Image docker du challenge manager
   3. `pulumi config set --secret challengeManagerSecret $(echo -n user:pass | base64)` : Identifiants pour se connecter au docker registry de l'image du challenge manager
   4. `pulumi config set kubeconfig ...` Nom du fichier du kubeconfig.yaml pour votre cluster kubernetes
   5. `pulumi config set registry ...` : Url du registry où sont stocké tous les challenges (ex: `gitlab.ctf.bzh/breizh-ctf/breizh-ctf-2023`)
   6. `pulumi config set --secret registryAuth $(echo -n user:pass | base64) ...` : Identifiants pour se connecter au docker registry des challenges
   7. `pulumi config set replicas ...` Nombre de replicas pour les challenges statiques
4. `yarn` ou `npm i` pour installer les dépendances
5. `pulumi up` 🚀

