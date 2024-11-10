//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;
/*
1)Because mappings have no length, we can't do something like balanceReceived.length or payments.length. 
It's technically not possible. In order to store the length of the deposits mapping, we have an additional 
helper variable numDeposits.
2)Also we can not access the "sub-mapping" value from the struct, hence we need to define a separate
getter-function.
*/
contract Mapping_With_Struct{

    struct Transaction{
        uint amount;
        uint timestamp;
    }

    struct Balance{
        uint totalBalance;
        uint numDeposits;
        mapping(uint=>Transaction) deposits;
        uint numWithdrawals;
        mapping(uint=>Transaction) withdrawals;
    }

    function getDepositNum(address from, uint numDeposits) public view returns(Transaction memory){
        return balances[from].deposits[numDeposits];
    }

    mapping(address=>Balance) public balances;

    function depositFunds() public payable{
        balances[msg.sender].totalBalance +=msg.value;

        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numDeposits] = deposit;
        balances[msg.sender].numDeposits++;
    }

    function withdrawFunds(address payable to, uint value) public payable{
        balances[msg.sender].totalBalance -= value;

        Transaction memory withdraw = Transaction(msg.value, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numDeposits] = withdraw;
        balances[msg.sender].numWithdrawals++;

        to.transfer(value);
    }
}