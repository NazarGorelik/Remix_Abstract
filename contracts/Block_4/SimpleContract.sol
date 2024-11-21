//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

contract SimpleContract{
    uint public myUint = 123;

    function setMyuint(uint newUint) public{
        myUint = newUint;
    }
}