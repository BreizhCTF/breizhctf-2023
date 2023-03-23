// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract Princesse {
    address public knight;

    bytes32 public doorCodeHash = 0xcda1cfbb1f53fe5abe398b23f631f130f827e2277f2a0dfd38cd49a8e7301bf0;

    constructor() {
        knight = msg.sender;
    }

    modifier onlyKnight() {
        require(msg.sender == knight, "Only the knight of the princess can call this function");
        _;
    }

    function setCode(uint _code) public onlyKnight {
        doorCodeHash = keccak256(abi.encodePacked(_code));
    }

    function becomeTheKnight(address _newKnight) public {
        knight = _newKnight;
    }
}