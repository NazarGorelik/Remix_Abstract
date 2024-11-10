//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

/*
msg(sender) - adress, which send a transaction to our contract.
to be able to transfer some value to the adress, adress must be payable.
function which expects to get some value to the contract, must have a payable modifier.
*/
contract WalletProject{
    uint public balanceReceived;

    function topUpBalance()public payable{
        balanceReceived += msg.value;
    }

    function getBalance()public view returns(uint){
        return address(this).balance;
    }

    function withdrawAll() public{
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }

    function withdrawToWallet(address payable exWallet)public{
        exWallet.transfer(getBalance());
    }
}