//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

contract WrapAround{
    uint256 public myUint;

    function setUint(uint _myUint) public{
            myUint = _myUint;
    }

    function incrementUint() public{
        myUint++;
    }

//without unchecked block we will receive an exception. If we decrement this value, while this evalue is 0,
//than we will receive the biggest integer
    function decrementUint() public{
        unchecked{
            myUint--;
        }
    }
}