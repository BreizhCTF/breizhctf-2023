// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

interface Potion {
   function hasMutate() external view returns(bool);
}

contract MutablePotion{

    bool public potionAllowed = false;

    bytes32 public potionHash;
    address public potionAddress;

    function opening(address potion) external{
        require(potion.code.length != 0, "Void potion are not accepted");
        require(Potion(potion).hasMutate() == false,"The potion function hasMutate failed");
        potionHash = potion.codehash;
        potionAddress = potion;
    }

    function ending(address potion) external {
        require(Potion(potion).hasMutate() == true,"The potion function hasMutate failed");
        require(potion == potionAddress, "The potion need to be the same as the opening");
        require(potion.codehash != potionHash, "The potion didn't mutate");

        potionAllowed = true;
    }
}