// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "./princess.sol";

contract ChateauDeKeriolet {
    bool public door = false;
    Princesse public princesse;

    constructor() {
        princesse = new Princesse();
    }

    function openTheSecretDoor(uint256 _code) public {
        require(msg.sender == address(princesse.knight()), "Only the knight of Princesse can open the door");
        require(princesse.doorCodeHash() == keccak256(abi.encodePacked(_code)), "The code is not the same as the princess set");
        door = true;
    }
}