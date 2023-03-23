// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract Druid {

    string[] internal herbs;
    mapping (address => bool) internal druid;

    modifier __(){
        require(msg.sender == address(this), "only this can call this");
        _;
    }

    modifier ___(){
        require(msg.sender == address(0), "only 0 can call this");
        _;
    }

    modifier ____(){
        require(msg.sender != address(this), "only other can call this");
        _;
    }

    modifier isMagic(){
        require(msg.sender != tx.origin && !isContract(msg.sender),"Only clever Druid can achieve this.");
        _;
    }

    constructor() {
        herbs.push("Viscum album");
        herbs.push("verbenae");
    }

    function popHerb() public __{
        uint length = getLengthHerbs();
        assembly {
            sstore(herbs.slot, sub(length, 1))
        }
    }

    function pushHerb(string memory herb) public ___{
        herbs.push(herb);
    }

    function updateHerb(uint _i, string memory herb) public ____{
        herbs[_i] = herb;
    }

    function getLengthHerbs() public view returns (uint256 length) {
        assembly {
            let ptr := herbs.slot
            length := sload(ptr)
        }
    }

    function becomeDruid() public pure returns(string memory){
        return "Yeah, right... as if it were so simple to become a druid!";
    }

    function getEltHerbs(uint256 idx) public view returns (string memory) {
        return herbs[idx];
    }

    function _isDruid(address addr) public view returns(bool) {
        return druid[addr];
    }

    function isContract(address _addr) private view returns (bool){
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0);
    }

    fallback() external isMagic{
        bytes memory data = new bytes(msg.data.length - 1);
        for (uint i = 1; i < msg.data.length; i++) {
            data[i-1] = msg.data[i];
        }
        (bool success, ) = address(this).call(data);
        require(success,"call failed");
    }
}