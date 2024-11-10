//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

/*
1)by default smart contract cant receive any value. for that we need either have a receive or fallBack function. 
2)if constructor of a contract is not payable, we can not deploy smart contract with any value. we will get an error.
3)receive function is called when there is no data in "calldata" field.
4)fallback function is called when we just call a trunsact function. format = 0xabcd. if we have receive and fallback 
functions, then without any message in "calldata" field will be called receive function, with data - fallback function.
if there is only fallback function, then it will always be called.
5)when we call setUint function it generates the following input: 
0x4ef65c3b0000000000000000000000000000000000000000000000000000000000000038, where first 4 bytes (8 numbers) are 
the identifyer of the function "4ef65c3b". if we call web3.utils.sha3("setUint(uint256)"), then we will get 0x4ef65c3b........
now we can just past the input value in "calldata" field and get the same output from out function setUint. 
Thereby transact function understands, which function
should be called from our smart contract (using first 4 bytes) and if there is now function in our contract, 
which identifyer doesnt correspond to the first 4 bytes of "calldata" field, then fallBack function will be called. 
If "calldata" field it empty, receive function is always called.
6)fallback function can be payable, receive function must be payable
7)reading functions are free. if you dont need to change anything in the blockchain, you dont need to inform other 
participatns.
*/ 
contract SampleFallback{
    uint public lastValueSent;
    string public lastFunctionCall;
    uint public myuint;

    receive() external payable{
        lastValueSent = msg.value;
        lastFunctionCall = "receive";
    }

    fallback() external payable{
        lastValueSent = msg.value;
        lastFunctionCall = "fallback";
    }


    function setUint(uint _newUint) public{
        myuint = _newUint;
    }
}