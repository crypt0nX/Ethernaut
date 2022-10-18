// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract EXP{
    function hack(address payable _addr) public  payable {
        _addr.call{value: msg.value, gas: 1000000}("");
    }
}
