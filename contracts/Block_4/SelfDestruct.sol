//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

/*
1)Selfdestruct function was removed from solidity, because it breaks the main idea of the blockchain - 
immutability. But there is still a way to "change" your smart contract using Proxy Upgrade Pattern.
https://docs.openzeppelin.com/upgrades-plugins/1.x/proxies
*/

contract SelfDestruct{
    receive() external payable{}

    function destorySmartContract() public{
        selfdestruct(payable(msg.sender));
    }
}