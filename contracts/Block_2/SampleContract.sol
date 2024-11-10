//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

/*
msg(sender) - adress, which send a transaction to our contract.
to be able to transfer some value to the adress, adress must be payable.
function which expects to get some value to the contract, must have a payable modifier.
*/
contract Samplecontract{
    string public myString = "Hello World";

    function updateString(string memory _newString)public payable {
        if(msg.value == 1 ether){
            myString = _newString;
        }else{
            //just return the value back to the sender wallet, if value != 1 ether
            payable(msg.sender).transfer(msg.value);
        }
    }
}