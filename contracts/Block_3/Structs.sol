//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;
/*
if we want to store payment datails in an logical object we can either create another smart-contract like a class 
(first way) or use a struct(seconds way). It is usually better to use structs, because it requires much less gas.
*/

//first way
contract Structs{

    PaymentDetails public payment;

    function deposit() public payable{
        payment = new PaymentDetails(msg.sender, msg.value);
    }
}

contract PaymentDetails{
    address public sender;
    uint public value;

    constructor(address _sender, uint _value){
        sender = _sender;
        value = _value;
    }
}

//second way
contract Structs2{
    struct PaymentDetailsStruct{
        address sender;
        uint value;
    }

    PaymentDetailsStruct public paymentStruct;

    function deposit() public payable{
        paymentStruct = PaymentDetailsStruct(msg.sender, msg.value);
    }
}