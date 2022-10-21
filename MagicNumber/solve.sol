pragma solidity ^0.5.11;

contract Deployer {
    address public _addr;
    constructor() public {
        address deployedContractAddress;
        assembly{
            let ptr := mload(0x40)
            mstore(ptr, shl(0x68, 0x69602A60005260206000F3600052600A6016F3))
            deployedContractAddress := create(0, ptr, 0x13)
            }
        _addr = deployedContractAddress;
    }
}




contract TEST{
    address solver = 0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99;

    function test() public payable{
        solver.call(abi.encodeWithSelector(bytes4(keccak256("enter(bytes8)"))));
    }
}

