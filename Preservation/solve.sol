// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract EXP{

    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; 

     function setTime(uint _time) public {
        owner = address(_time);
  }

}

contract UTIL{
   // address public addr = 0xd9145CCE52D386f254917e481eB44e9943F39138;
   // uint public num = uint(addr);

    function address_to_uint(address _addr) public pure returns(uint){
        return uint(_addr);
    }

     function uint_to_address(uint _num) public pure returns(address){
        return address(_num);
    }
}
