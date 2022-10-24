// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;
    function notify(address user, bytes calldata msgData) external;
    function raiseAlert(address user) external;
}

contract DoubleEntryPoint {
    address  public cryptoVaultAddr ;
    function setCryptoVaultAddr(address addr) public  {
        cryptoVaultAddr = addr;
    }
    function handleTransaction(address user, bytes calldata msgData) external {
        (,,address addr) = abi.decode(msgData[4:], (address, uint256, address));   
        if (addr == cryptoVaultAddr) {
            IForta(msg.sender).raiseAlert(user);
        }
    }
}

/*
await contract.forta()
web3.utils.sha3("setDetectionBot(address)").slice(0,10) + "000000000000000000000000"+ "ABd8E943420Cc59F18080cF507e193EEF347Be2f"

web3.eth.sendTransaction({from:player, to:"0xB4cb8446CF385C2fbA158910bcD0E7774369A2c1", data:web3.utils.sha3("setDetectionBot(address)").slice(0,10) + "000000000000000000000000"+ "ABd8E943420Cc59F18080cF507e193EEF347Be2f"})
 */
