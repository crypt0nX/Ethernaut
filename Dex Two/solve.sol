// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import '@openzeppelin/contracts/math/SafeMath.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract evil_SwappableTokenTwo is ERC20 {
  address private _dex;
  constructor(address dexInstance, string memory name, string memory symbol, uint initialSupply) public ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
        _dex = dexInstance;
  }

  function approve(address owner, address spender, uint256 amount) public returns(bool){
    require(owner != _dex, "InvalidApprover");
    super._approve(owner, spender, amount);
  }

}


