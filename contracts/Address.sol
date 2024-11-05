//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

//in solidity there is a special data type, address, which also has a parameter balance
contract Address{
    address public myAddress;

    function setAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    function getAddressBalance() public view returns(uint){
        return myAddress.balance;
    }
}