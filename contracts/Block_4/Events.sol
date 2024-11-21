//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

contract Events_1{
    mapping(address=>uint) public tokenBalance;

    event TokensSent(address indexed _from, address indexed _to, uint _value);

    constructor(){
        tokenBalance[msg.sender] = 100;
    }

    function sendTo(address _to, uint _value) public returns(bool){
        require(tokenBalance[msg.sender]>=_value, "Not enough funds");
        tokenBalance[msg.sender]-=_value;
        tokenBalance[_to]+=_value;

        //emit can also stay before require, but it is called only at the end of the function.Hence it is not important,
        //where emit stays
        emit TokensSent(msg.sender, _to, _value);

        return true;
    }
}