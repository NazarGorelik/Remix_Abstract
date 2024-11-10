//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;
/*
1)same as HashMap in java or Dictionary in c#.
2)Mappings have no length. It's important to understand this. Arrays have a length, but, 
because how mappings are stored differently, they do not have a length. Let's say you have a mapping 
mapping(uint => uint) myMapping, then all elements myMapping[0], myMapping[1], myMapping[123123], ... are 
already initialized with the default value. If you map uint to uint, then you map key-type "uint" to value-type "uint".
3)
*/
contract Mapping{
    mapping(uint => bool) public myMapping;

    //this function is automatically created for mapping
    function getterFunction(uint key) public view returns(bool){
        return myMapping[key];
    }
    function setValue(uint index) public{
        myMapping[index] = true;
    }


    //for exmaple for storing WL wallets
    mapping(address => bool) public adressMapping;

    function setAddress() public{
        adressMapping[msg.sender] = true;
    }


    //nested mapping
    mapping(uint=>mapping(uint=>bool)) public uintUintBoolMapping;

    function setUintuintBoolMapping(uint key1, uint key2, bool value) public{
        uintUintBoolMapping[key1][key2] = value;
    }
}