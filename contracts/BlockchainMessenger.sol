//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

//constructor is called only once during deployment of the smart contract and can not be overloaded
contract BlockchainMessenger{

    uint public changeCounter;
    address public owner;
    string public message;

    constructor(){
        owner = msg.sender;
    }

    function updateMessage(string memory _message)public{
        if(msg.sender == owner){
            message = _message;
            changeCounter++;
        }
    }
}