//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

/*
Both functions are reading functions.
A view function is a function that reads from the state but doesn't write to the state. 
A classic view function woule be a getter-function.
A pure function is a function that neither writes, nor reads from state variables. 
It can only access its own arguments and other pure functions.
*/
contract ViewAndPureFunctions{
    
    uint public variable;

    function getVariable() public view returns(uint){
        return variable;
    }

    function getSum(uint a, uint b) public pure returns(uint){
        return a + b;
    }
}