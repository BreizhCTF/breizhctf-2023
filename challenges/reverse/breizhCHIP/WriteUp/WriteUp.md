# BreizhCTF 2023 - Breizh CHIP

## Méthodologie

Le fichier donné est un `.circ`. On nous annonce dans l'ennoncé qu'il faut utiliser logisimevolution pour l'utiliser. Après ouverture, on voit le circuit logique s'afficher. Trois blocs attirent notre attention. Les deux premiers sont assez similaires, composés d'un registre, d'un additionneur et d'une ROM. Ils sortent des valeures de la manière suivante :

```
x = registre1
y = registre2
sortie1 = ROM1[registre1]
sortie2 = ROM2[registre2]
``` 
Avec :
```
registre1_apres_<i>_ticks_dhorloge = <i>                % 4
registre2_apres_<i>_ticks_dhorloge = arrondi_inf(<i>/2) % 4
```
Ces valeures sont ensuite xorées, donnant la suite chiffrante suivante :
```
chiffrant_<i> = ROM1[registre1_apres_<i>_ticks_dhorloge] ^ ROM2[registre2_apres_<i>_ticks_dhorloge]
```
Le xor étant inversif, on va reconstituer la suite chiffrante et la réappliquer sur notre chiffré : 
```python
ROM1 = [0xde, 0xad, 0xbe, 0xef]
ROM2 = [0xca, 0xfe, 0xba, 0xbe]

for (i, cipher) in enumerate([0x56, 0x3d, 0x08, 0x52, 0x30, 0x51, 0x7b, 0x6d, 0x27, 0x4a, 0x6d, 0x42, 0x11, 0x67, 0x34, 0x23, 0x4b, 0x24, 0x08, 0x20, 0x34, 0x3a, 0x2d, 0x6d, 0x27, 0x1a]):
    print(chr(cipher ^ ROM1[i%4] ^ ROM2[i//2%4]), end="")
```