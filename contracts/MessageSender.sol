//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

//msg.sender contains the address of the latest contract, which interacted with out address
contract MessageSender{
    address public someAddress;

    function updateSomeAddress() public{
        someAddress = msg.sender;
    }
}