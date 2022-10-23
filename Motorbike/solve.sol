pragma solidity ^0.6.0;

contract Attacker {

    constructor() public {

    }
    function destruct(address payable addr) public {
        selfdestruct(addr);
    }

}
