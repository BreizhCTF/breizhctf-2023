# Challenge

- Nom : description
- Difficulté : normal
- Auteur : 0xdeadbeef

## Description

Vous en avez assez de résoudre des challenges ? Que diriez-vous d'une petite partie de demineur pour vous détendre ?

- Fichier: [demineur](ressources/challenge)
- sha1sum: 49a6404095a99dec1326a9a7baee0f4cb3396583

- Libc: [libc.so.6](ressources/libc.so.6)
- sha1sum: a25e30fdcc1c375becbe6f07aea167d82881097e


## Compilation

Le script de compilation se trouve dans le [Makefile](Docker/src/Makefile)

Il ne faut pas donner les fichiers compilé sur votre machine, à la place vous devez utiliser le script
[extract_resources.sh](resources/extract_resources.sh) qui sort les fichiers directement compilés
dans le Dockerfile.
