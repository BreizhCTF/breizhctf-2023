// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract Bienvenue{

    bool public solved = false;

    function Bienvenue_(string memory G, string memory C1, string memory C2) public{
        require(keccak256(abi.encodePacked((G))) == keccak256(abi.encodePacked(("Galette")))); //Vérifie l'égalité entre G et "Galette"
        require(keccak256(abi.encodePacked((C1))) == keccak256(abi.encodePacked(("Cidre")))); //Vérifie l'égalité entre C1 et "Cidre"
        require(keccak256(abi.encodePacked((C2))) == keccak256(abi.encodePacked(("Ctf")))); //Vérifie l'égalité entre C2 et "Ctf"

        solved = true;
    }

}