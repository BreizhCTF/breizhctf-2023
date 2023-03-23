// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract RandomGame{
    uint public gammerCount;
    bool public gameOver = false;
    address public winner;

    address[] gammers;

    constructor() payable{
        require(msg.value == 10 ether);
    }

    modifier onlyHacker{
        require(
            address(this).balance % 1 ether != 0 ether,
            "this is an honnorable prize only for hacker"
        );
        _;
    }

    function join() public payable {
        require(msg.value == 1 ether, "You must send 1 ether to join the game");
        require(!gameOver, "The game is over. No more gammers allowed");

        gammers.push(msg.sender);
        gammerCount++;
    }

    function chooseWinner() public {
        require(gammerCount > 1, "There must be at least 2 players to choose a winner");
        require(!gameOver, "The winner has already been chosen");

        uint randomIndex = uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % gammerCount;
        
        winner = gammers[randomIndex];
        gameOver = true;
    }

    function Th3_sp3Ci41_prize() public onlyHacker {
        (bool sent,) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Address: unable to send value");
    }
}