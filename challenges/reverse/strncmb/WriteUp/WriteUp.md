BreizhCTF 2023 - strnCMB
==========================

### Challenge details

| Event                    | Challenge  | Category       | Points | Solves      |
|--------------------------|------------|----------------|--------|-------------|
| BreizhCTF 2023           | strnCMB  | Reverse      | ???    | ???         |


Je m'étais fait un programme super sécurisé pour récupérer mon mot de passe si je l'oubliais.

Cependant je ne me souviens plus de l'algorithme que j'avais implémenté à l'époque.  

Si tu veux bien m'aider à retrouver mon mot passe ?  

### TL;DR

Le binaire fourni effectue 3 comparaison de chaine de caractères.
L'affichage des chaines de carractère suffit pour récupérer le flag.

### Méthodologie

Dans ce challenge, nous sommes en possession d'un binaire de type ELF:
```bash
$ file strncmb
strncmb: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=96f73f6bd5725aa6fb596ef97953f479cf89ff03, for GNU/Linux 4.4.0, not stripped
```

L'affichage des chaines de caractères à l'aide de la commande strings nous permet de récupérer le flag en trois parties:

```bash
$ strings strncmb | grep BZH -A 6
BZHCTF{
1 strnCMB valid
C0mB13n
2 strnCMB valid
_dE_
3 strnCMB valid
strnCMB}
```

Le binaire effectue en effet 3 comparaisons de chaine de caractère pour valider le flag.

# Flag

`BZHCTF{C0mB13n_dE_strnCMB}`