//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

//constructor is called only once during deployment of the smart contract and can not be overloaded
contract Address{
    address public myAddress;

    constructor(address _someAddress){
        myAddress = _someAddress;
    }
}