//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;
/*
This follows the so-called Checks-Effects-Interaction pattern. As a rule of thumb: 
You interact with outside addresses last, no matter what. Unless you have a trusted source. 
So, first set your Variables to the state you want, as if someone could call back to the Smart Contract before 
you can execute the next line after .
*/
contract Mapping_Advanced{

    mapping(address=>uint) public addressesWithBalances;

    function sendFundes()public payable{
        addressesWithBalances[msg.sender] += msg.value;
    }
    
    function getBalanceOfSmartContract() public view returns(uint){
        return address(this).balance;
    }

    //secure way to withdraw funds from smartContract
    function withdrawAll(address payable to) public {
        uint withdrawingBalance = addressesWithBalances[msg.sender];
        addressesWithBalances[msg.sender] = 0;
        to.transfer(withdrawingBalance);
    }

    function withdraw(address payable to, uint value) public{
        if(value <= addressesWithBalances[msg.sender]){
            addressesWithBalances[msg.sender]-=value;
            to.transfer(value);
        }
    }
}