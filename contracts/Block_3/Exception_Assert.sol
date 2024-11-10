//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;
/*
1)Assert is used to validate invariants. Those are states our contract or variables should never reach, ever. 
For example, if we decrease a value then it should never get bigger, only smaller.
2)If assert is called it means "wait, wait, it is a technical error, dont do it again".
3)Examples: division by zero, out of bounds index and so on
*/
contract Exception_Assert{
    mapping(address=>uint8) public addressesWithBalances;

    function depositFunds() public payable {
        //will get an exception if value > 255.
        assert(msg.value == uint8(msg.value));
        addressesWithBalances[msg.sender] += uint8(msg.value);
        //balance can only get bigger after depositing
        assert(addressesWithBalances[msg.sender] >= uint8(msg.value));
    }

    function withdraw(address payable to, uint8 value) public{
        require(value<=addressesWithBalances[msg.sender], "Not enough funds!");
        //balance is always bigger after withdrawing
        assert(addressesWithBalances[msg.sender] >= addressesWithBalances[msg.sender] - value);
        addressesWithBalances[msg.sender]-=value;
        to.transfer(value);
    }
}