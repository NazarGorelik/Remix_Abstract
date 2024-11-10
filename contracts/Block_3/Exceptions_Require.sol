//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;
/*
1)importatn thing is that "require" will return a remaining gas(gas which wasnt used yet) back to the user, 
if the error occurs. Require is used to validate user input.
2)Revert consumes all the remaining gas and provides an error message.
*/
contract Exception_Require{

    mapping(address=>uint) public addressesWithBalances;

    function depositFunds() public payable {
        addressesWithBalances[msg.sender] += msg.value;
    }

    function withdraw(address payable to, uint value) public{
        require(value<=addressesWithBalances[msg.sender], "Not enough funds!");

        //alternative way, works same to require
        // if(value<=addressesWithBalances[msg.sender]){
        //     revert("Not enough funds!");
        // }

        addressesWithBalances[msg.sender]-=value;
        to.transfer(value);
    }
}