//SPDX-License-Identifier: UNLICENSED

/*
1)if the token price is too high, transaction will not got minted.
2)Here is modifier from Owner.sol contract used
3)many modifiers can be applied to one function and modifiers can have a parameters
4)it is not a mandatory to have require block in modifier. Everyting can be inside modifier.
5)to override a modifier the declaration must have virtual word and overriden modifier override word.
6)https://www.freecodecamp.org/news/what-are-solidity-modifiers/
https://www.geeksforgeeks.org/solidity-function-modifiers/
*/

pragma solidity 0.8.26;

import "./Owner.sol";

contract Modifiers is Owner{

    mapping(address => uint) public tokenBalance;

    // address owner;

    uint tokenPrice = 1 ether;

    constructor() {
        tokenBalance[owner] = 100;
    }

    //override modifier
    modifier onlyOwner() override {
        require(msg.sender == owner, "Overriden onlyOwner modifier");
        _;
    }

    function createNewToken() public onlyOwner{
        // require(msg.sender == owner, "You are not allowed");
        tokenBalance[owner]++;
    }

    function burnToken() public onlyOwner tokenBalanceMod(tokenBalance){
        // require(msg.sender == owner, "You are not allowed");
        tokenBalance[owner]--;
    }

    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough tokens");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }
}