pragma solidity ^0.6.0;


contract attacker {

    constructor() public {
    }
    
    fallback() external payable {
 //      revert();
        assert(false);
    }

}
