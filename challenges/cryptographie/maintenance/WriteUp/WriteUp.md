BreizhCTF 2023 - Maintenance
==========================

### Challenge details

| Event          | Challenge | Category      | Points | Solves |
| -------------- | --------- | ------------- | ------ | ------ |
| BreizhCTF 2023 | Maintenance | Cryptographie | ???    | ???    |


![maintenance](https://media.tenor.com/_6OIYttlyJoAAAAC/maintenance.gif)
    
Afin de rendre le BreizhCTF accessible aux utilisateurs sous environnement i3, une interface en ligne de commande a été développée. Suite à plusieurs intrusions, nous avons décidé de passer l'interface en maintenance. En espérant que cela soit suffisant...

Auteur: [Zeecka](https://twitter.com/Zeecka_)

nc maintenance.ctf.bzh 30011

### TL;DR

Le service en maintenance permettait la génération d'un jeton utilisateur chiffré avec un mode ECB. L'injection dans le pseudo de l'utilisateur permettait alors de générer les blocs souhaités pour générer un token administrateur.

### Méthodologie

Le scénario nominal de l'application permet de demander un jeton d'authentification à partir d'un nom et de s'authentifier avec le jeton:

```
Bonjour et bienvenue sur l'interface CLI du BreizhCTF !

---------------------------------------
1. Demander un jeton d'authentification
2. S'authentifier
3. Quitter
---------------------------------------

Entrez votre choix (1,2,3): 1
La fonctionnalité d'enregistrement vous permet de récupérer un compte invité.
Renseigner votre nom: a
Vous pouvez à présent vous authentifier à l'aide de votre jeton 953b5025695b9ffa2f42ef3f4368763872683b5cb5bda8b61f6c0c139922f13259385586d4c74c42461c9821f30549e9.
Celui-ci est valide pour une durée de 3 minutes.

En cas d'erreur, transmettez ce code à votre administrateur: 757365726e616d653d613b726f6c653d696e766974653b74696d653d31363733383136303832.

---------------------------------------
1. Demander un jeton d'authentification
2. S'authentifier
3. Quitter
---------------------------------------

Entrez votre choix (1,2,3): 2
Veuillez renseigner votre nom: a
Veuillez renseigner votre jeton d'authentification: 953b5025695b9ffa2f42ef3f4368763872683b5cb5bda8b61f6c0c139922f13259385586d4c74c42461c9821f30549e9
Vous être a présent connecté en tant qu'invité. Le serveur est actuellement en maintenance, seuls les administrateurs sont autorisés à se connecter.

---------------------------------------
1. Demander un jeton d'authentification
2. S'authentifier
3. Quitter
---------------------------------------

Entrez votre choix (1,2,3): 
```

Le premier constat est le suivant: pour un même nom d'utilisateur, il est possible de générer plusieurs jetons. Seul la fin du jeton change et celui-ci semble invalidé après 3 minutes.

L'inspection du code à transmettre à l'administrateur nous permet de confirmer l'hypothèse de l'utilisation d'un chiffrement par bloc avec un timestamp:

```python
import binascii
print(binascii.unhexlify("757365726e616d653d613b726f6c653d696e766974653b74696d653d31363733383136303832"))
# b'username=a;role=invite;time=1673816082'
```

Nous avons donc un token avec un role invité comportant notre "username" et un timestamp.
Afin de vérifier le mode de chiffrement par bloc, nous allons utiliser un nom composé uniquemebt de la lettre "a" d'une taille égale ou supérieur à 2 blocs afin d'identifié si des blocs similaires apparaissent.

Ici, la taille d'un bloc n'est pas connu, nous pouvons alors assumer qu'il s'agit d'une taille standard de 16 ou 32 caractères. Nous renseignons alors un pseudo de 64*"a" : `aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa`.

> Note: ce comportement peut également être identifié à l'aide d'une recherche d'overflow.

```
Bonjour et bienvenue sur l'interface CLI du BreizhCTF !

---------------------------------------
1. Demander un jeton d'authentification
2. S'authentifier
3. Quitter
---------------------------------------

Entrez votre choix (1,2,3): 1
La fonctionnalité d'enregistrement vous permet de récupérer un compte invité.
Renseigner votre nom: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
Vous pouvez à présent vous authentifier à l'aide de votre jeton a5ab67d0983fb22424077dc0f740f8ce485f149d0285de4d65c2484b6e8a4c4b485f149d0285de4d65c2484b6e8a4c4b485f149d0285de4d65c2484b6e8a4c4bea2dd7ec51fb011ee56f880daba3001bc99b4e3ad3310f38f71446845eea26311d016fdf40ae85b280f333642c28ab7a.
Celui-ci est valide pour une durée de 3 minutes.

En cas d'erreur, transmettez ce code à votre administrateur: 757365726e616d653d616161616161616161616161616161616161616161616161616161616161616161616161616161616161616161616161616161616161616161616161616161613b726f6c653d696e766974653b74696d653d31363733383136363531.
```

On identifie ainsi la répétition du bloc "485f149d0285de4d65c2484b6e8a4c4b" codant notre lettre "aaaaa..". Le mode ECB est validé.

Ici le jeton peut être décomposé de la façon suivante:

- a5ab67d0983fb22424077dc0f740f8ce  # username=aaaaaaa
- 485f149d0285de4d65c2484b6e8a4c4b  # aaaaaaaaaaaaaaaa
- 485f149d0285de4d65c2484b6e8a4c4b  # aaaaaaaaaaaaaaaa
- 485f149d0285de4d65c2484b6e8a4c4b  # aaaaaaaaaaaaaaaa
- ea2dd7ec51fb011ee56f880daba3001b  # aaaaaaaaa;role=i
- c99b4e3ad3310f38f71446845eea2631  # nvite;time=16738
- 1d016fdf40ae85b280f333642c28ab7a  # 16651  (+ padding)

La taille des blocs peut être confirmée en ajustant le niveau de "a" dans l'username, par exemple:

- a5ab67d0983fb22424077dc0f740f8ce  # username=aaaaaaa
- 485f149d0285de4d65c2484b6e8a4c4b  # aaaaaaaaaaaaaaaa
- 485f149d0285de4d65c2484b6e8a4c4b  # aaaaaaaaaaaaaaaa
- 485f149d0285de4d65c2484b6e8a4c4b  # aaaaaaaaaaaaaaaa
- 485f149d0285de4d65c2484b6e8a4c4b  # aaaaaaaaaaaaaaaa
- 6400d13467c58e941b49e82d355e0e46  # ;role=invite;tim
- 0f61379f9547126363282643e16617a5  # e=1673817061  (+ padding)

Ce mode de chiffrement par bloc semble être un mode ECB. Nous sommes a présent en mesure de construire n'importe quel bloc et constituer un jeton avec un role administrateur et une durée de vie élevée.

Pour cela il faut dans un premier temps ajouter du padding dans notre username pour finir le premier bloc (ici 7 lettres).

Ensuite nous fabriquons 2 blocs avec un role admin et une variable time:
- ;role=admin;time
- =167381706100000  # padding avec des 0

on a donc un username qui vaut: `aaaaaaa;role=admin;time=167381706100000`.

```
Bonjour et bienvenue sur l'interface CLI du BreizhCTF !

---------------------------------------
1. Demander un jeton d'authentification
2. S'authentifier
3. Quitter
---------------------------------------

Entrez votre choix (1,2,3): 1
La fonctionnalité d'enregistrement vous permet de récupérer un compte invité.
Renseigner votre nom: aaaaaaa;role=admin;time=167381706100000
Vous pouvez à présent vous authentifier à l'aide de votre jeton a5ab67d0983fb22424077dc0f740f8ce35d6946370fab48bcb41109e57dd1deb23c4ed6cb17c7ca5269666e965322b656400d13467c58e941b49e82d355e0e468d157cee04febdd333427e0a1fe8fd22.
Celui-ci est valide pour une durée de 3 minutes.

En cas d'erreur, transmettez ce code à votre administrateur: 757365726e616d653d616161616161613b726f6c653d61646d696e3b74696d653d3136373338313730363130303030303b726f6c653d696e766974653b74696d653d31363733383932363831.

---------------------------------------
1. Demander un jeton d'authentification
2. S'authentifier
3. Quitter
---------------------------------------

Entrez votre choix (1,2,3):
```

Ici on a donc le token suivant:
- a5ab67d0983fb22424077dc0f740f8ce  # username=aaaaaaa
- 35d6946370fab48bcb41109e57dd1deb  # ;role=admin;time
- 23c4ed6cb17c7ca5269666e965322b65  # =167381706100000
- 6400d13467c58e941b49e82d355e0e46  # ;role=invite;tim
- 8d157cee04febdd333427e0a1fe8fd22  # e=1673892681


On peut donc renvoyer le token avec les 3 premiers blocs seulement:

- a5ab67d0983fb22424077dc0f740f8ce  # username=aaaaaaa
- 35d6946370fab48bcb41109e57dd1deb  # ;role=admin;time
- 23c4ed6cb17c7ca5269666e965322b65  # =167381706100000

a5ab67d0983fb22424077dc0f740f8ce35d6946370fab48bcb41109e57dd1deb23c4ed6cb17c7ca5269666e965322b65

username=aaaaaaa;role=admin;time=167381706100000

```
Entrez votre choix (1,2,3): 2    
Veuillez renseigner votre nom: aaaaaaa
Veuillez renseigner votre jeton d'authentification: a5ab67d0983fb22424077dc0f740f8ce35d6946370fab48bcb41109e57dd1deb23c4ed6cb17c7ca5269666e965322b65
Vous être a présent connecté en tant qu'administrateur. BZHCTF{Oh_Noh_You_Pwned_Ze_BreizhCTF_!}

---------------------------------------
1. Demander un jeton d'authentification
2. S'authentifier
3. Quitter
---------------------------------------

Entrez votre choix (1,2,3):
```

On a donc le flag: `BZHCTF{Oh_Noh_You_Pwned_Ze_BreizhCTF_!}`.

#### Flag

`BZHCTF{Oh_Noh_You_Pwned_Ze_BreizhCTF_!}`

Auteur: [Zeecka](https://twitter.com/zeecka_)