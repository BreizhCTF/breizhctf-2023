# Blockchain 101

## Objectif
Le but de ce défi est de changer la valeur de la variable `solved` à `true`.

## Détails
Pour réussir ce défi, il faut appeler la fonction `Bienvenue_()` en passant les trois chaînes de caractères nécessaires (`G`, `C1` et `C2`) qui satisfont les conditions des `require()` suivantes :

```js
require(keccak256(abi.encodePacked((G))) == keccak256(abi.encodePacked(("Galette"))));
require(keccak256(abi.encodePacked((C1))) == keccak256(abi.encodePacked(("Cidre"))));
require(keccak256(abi.encodePacked((C2))) == keccak256(abi.encodePacked(("Ctf"))));
```

Ces `require()` vérifient si les valeurs de `G`, `C1` et `C2` sont respectivement égales à "Galette", "Cidre" et "Ctf". Si ces conditions ne sont pas satisfaites, l'appel à la fonction `Bienvenue_()` échouera.

## Attaque
Pour résoudre le défi, il suffit d'appeler la fonction `Bienvenue_()` avec les paramètres suivants : `Bienvenue_("Galette","Cidre","CTF")`.

Une fois que la fonction a été appelée avec succès, la variable `solved` aura été changée à `true` et le défi sera réussi.

