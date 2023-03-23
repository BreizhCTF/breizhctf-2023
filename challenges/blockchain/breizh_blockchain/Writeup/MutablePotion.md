# Mutable Potion

## Objectif

L'objectif est de créer une potion dont le bytecode peut muter avec le temps en utilisant l'opcode CREATE2 pour créer des contrats metamorphiques.

## Détails

Depuis 2019, il est possible de créer des contrats metamorphiques grâce à la création de l'opcode CREATE2. Pour relever ce défi, il faut utiliser l'implémentation de Oage, qui est disponible sur son article [Medium](<https://0age.medium.com/the-promise-and-the-peril-of-metamorphic-contracts-9eb8b8413c5e>) et sur son [GitHub](<https://github.com/0age/metamorphic>).

Pour résoudre le défi, il faut suivre ces étapes :

1.  Déployer la première potion, qui validera la fonction `opening()`.
2.  Créer un contrat metamorphique à partir de la première potion.
3.  Appeler la fonction `opening()` avec l'adresse du contrat metamorphique.
4.  Effectuer un self-destruct sur le code du contrat metamorphique afin de le redéployer à la même adresse la deuxième potion.
5.  Déployer la deuxième potion, qui validera la fonction `ending()`.
6.  Modifier le code du contrat metamorphique avec la deuxième potion en utilisant la fonction `deployMetamorphicContractFromExistingImplementation(...)`.
7.  Appeler la fonction `ending()` avec l'adresse du contrat metamorphique.

En suivant ces étapes, le défi sera résolu avec succès.

## Résolution

Dans le cadre de la résolution, deux contrats, Potion1 et Potion2, doivent être déployés.

Le contrat Potion1 a un retour de fonction `hasMutate()` qui renvoie `false` pour passer la condition de `opening()`. De plus, il contient un self-destruct pour détruire le code à cette adresse afin de déployer Potion2 par la suite.

Voici le code du contrat Potion1 :

    pragma solidity 0.8.19;

    contract Potion1{

        uint public test = 1;

        function hasMutate() public pure returns(bool){
            return false;
        }

        function destrcut() public{
            selfdestruct(payable(tx.origin));
        }
    }

Voici le code de Potion2:

    pragma solidity 0.8.19;

    contract Potion2{

        function hasMutate() public view returns(bool){
            return true;
        }
    }

convient de noter que la fonction `deployMetamorphicContractFromExistingImplementation(...)` prend comme input :

    bytes32 salt
    address implementation
    bytes calldata init

Les 20 premier bytes de salt doivent être egaux à l'adresse du deployer.

MK.
