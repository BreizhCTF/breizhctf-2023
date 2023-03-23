// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "./elixir.sol";
import "./druid.sol";

abstract contract ReentrancyGuard {
    bool internal locked;

    modifier noReentrant() {
        require(!locked, "No re-entrancy");
        locked = true;
        _;
        locked = false;
    }
}

contract Getafix is ReentrancyGuard {
    Elixir public elixir;
    Druid public druid;

    modifier onlyDruid(){
        require(isDruid(msg.sender),"Only Druid can trade with Getafix");
        _;
    }

    constructor(Druid _druid) payable{
        elixir = new Elixir();
        druid = _druid;
    }

    function isDruid(address entity) public view returns(bool){
        return druid._isDruid(entity);
    }

    function deposit() external payable noReentrant onlyDruid { 
        bool success = elixir.mint(msg.sender, msg.value);
        require(success, "Failed to mint token");
    }

    function withdraw() external noReentrant onlyDruid { 
        uint256 balance = getEntityBalance(msg.sender);
        require(balance > 0, "Insufficient balance");

        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Failed to send Ether");

        success = elixir.burnAccount(msg.sender);
        require(success, "Failed to burn token");
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function getEntityBalance(address entity) public view returns (uint256) {
        return elixir.balanceOf(entity);
    }
}