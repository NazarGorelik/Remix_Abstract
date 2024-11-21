//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

/*
1)Better just to read the scrip. The idea is that you can verify your smart contract using etherscan,
and after you will be able to call read and write function directly from etherscan.
*/

contract BlockExplorer{

    mapping(address => uint) public balance;

    constructor() {
        balance[msg.sender] = 100;
    }

    function transfer(address to, uint amount) public {
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }

    function someCrypticFunctionName(address _addr) public {
        balance[_addr] = 5;
    }
}
