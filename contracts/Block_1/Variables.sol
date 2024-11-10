//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

contract Variables{
    bool public myBool;

    function setMybool(bool _myBool) public{
        myBool = !_myBool;
    }

/*
1)signed integers(int) also can have negatibve numbers. Unsigned(uint) - only positiv numbers, but range is bigger then by int.
2)if we want to assign the value to default value, it is better to left the variable unassigned. Because every assignment costs additional gas.
*/
    uint public myUint;

    function setMyInt(uint _myUnt) public{
        myUint = _myUnt;
    }

//write function gonna break after myInt8 reaches 255, cause 2^8-1 = 255
    uint8 public myUint8 = 250;

    function incrementUint8() public{
        myUint8++;
    }

    int public myInt = -10;

    function incrementInt() public {
        myInt++;
    } 
}