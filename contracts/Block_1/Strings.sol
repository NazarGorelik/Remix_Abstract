//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

//in solidity it is not recommended to work with strings, beacause they take too mache mempory in blockchain
contract Strings{
    string public myString = "Hello World";
    bytes public myBytes = "Hello World"; 

    function setMyString(string memory _myString) public{
        myString = _myString;
    }

//так уебански происходит сравнение стрингов. Reference datatypes need a memory location.
    function compareTwoString(string memory _myString) public view returns(bool){
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }
}