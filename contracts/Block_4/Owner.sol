//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;


contract Owner{
    address owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner() virtual{
        require(msg.sender == owner, "You are not allowed");
        _;
    }

    modifier tokenBalanceMod(mapping(address => uint) storage tokenBalance){
        if(tokenBalance[msg.sender] >= 100){
            _;
        }else{
            revert("Owner token balance must be more then 100 tokens!");
        }
        //require(tokenBalance[msg.sender] >= 100, "Balance is less then 100 tokens!!!");
    }
}