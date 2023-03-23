# RandomGame

## Objectif
L'objectif de ce défi est de vider le smart contract RandomGame de ses ethers.

## Détails
En étudiant le smart contract RandomGame, nous remarquons que la fonction `Th3_sp3Ci41_prize()` permet de vider la balance du contrat. Cependant, cette fonction est protégée par le modificateur `OnlyHacker`, ce qui rend difficile l'appel de cette fonction directement.

Afin de résoudre ce défi, nous devons modifier la condition dans le modificateur `OnlyHacker` qui empêche l'appel de la fonction `Th3_sp3Ci41_prize()`. La condition actuelle est la suivante :

```js
    balance % 1 ether != 0
```

Cela signifie que la balance du contrat doit être différente d'un multiple entier de 1 ether. Pour contourner cette condition, nous devons envoyer une valeur avec une partie décimale, telle que 0,7 ether, pour que la condition soit satisfaite.

Cependant, la seule fonction qui permet d'envoyer des ethers au contrat est `join()`, qui nécessite une valeur de 1 ether exactement. Il n'y a pas de fonction `fallback()` ou `receive()` pour envoyer des ethers par transaction.

La solution consiste donc à utiliser la fonction `selfdestruct()` d'un contrat pour transférer les ethers qu'il détient au smartcontract RandomGame.

## Attaque

Pour exploiter cette faille, nous devons créer un smart contract qui détient des ethers d'une valeur qui n'est pas un multiple entier de 1 ether, et appeler la fonction `selfdestruct()` en pointant sur le contrat RandomGame.

```js
function attack(address randomGame) public payable {

    // cast address to payable
    address payable addr = payable(address(randomGame));
    selfdestruct(addr);
}
```

De ce fait, l'inégalite dans le modifier `OnlyHacker` sera vrai.

On peut donc appeler la fonction `Th3_sp3Ci41_prize()`.

Une fois les ethers récupérés, le défi sera réussi et le flag sera obtenu.

MK.
