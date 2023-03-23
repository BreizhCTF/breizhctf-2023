// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract Lucky {
  uint256 private seed;
  mapping(address => uint) public consecutiveWins;
  bool public solved = false;

  constructor() payable {
      seed = block.timestamp;
  }

  function play(uint256 guess) public payable {
      require(msg.value == 1 ether, "La mise doit etre de 1 ether.");
      require(guess == 0 || guess == 1, "Vous devez deviner 0 ou 1.");

      uint256 randomNumber = uint256(keccak256(abi.encodePacked(seed, msg.sender, block.prevrandao, block.timestamp)));
      uint256 result = randomNumber % 2;

      uint256 payout = result == guess ? msg.value : msg.value / 1000;
      //payable(msg.sender).transfer(payout);
      (bool sent, ) = msg.sender.call{value: payout}("");
      require(sent, "Failed to send Ether");

      consecutiveWins[msg.sender] = result == guess ? consecutiveWins[msg.sender] + 1 : 0;

      seed = randomNumber;
  }

  function isSolve(address player) public returns(bool){
      if(consecutiveWins[player] >= 10){solved = true;}
      return solved;
  }
}