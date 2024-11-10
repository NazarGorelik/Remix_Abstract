//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;
/*
1)If the target address is a contract and the transfer fails, then .transfer will result in an exception and 
.send will simply return false, but the transaction won't fail.
2)Always check the return value of low level send functions. Ideally with an require(sentSuccessful) or so.
3)In solidity there are only 3 ways to send ether from one contract to another: transfer(), send() and call().
4)https://shishirsingh66g.medium.com/solidity-part-4-transfer-send-reverse-5baf650acdc1
*/

contract Sender{
    receive() external payable{}

    function getTheBalance()public view returns(uint){
        return address(this).balance;
    }

    function withdrawTransfer(address payable to) public{
        to.transfer(10);
    }

    function withdrawSend(address payable to) public{
        bool isSent = to.send(10);
        require(isSent, "Sending was unsuccessfull");
    }
}

contract ReceiverNoAction{
    receive() external payable{}

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

contract ReceiverAction{
    uint public receivedBalance;

    receive() external payable{
        receivedBalance+=msg.value;
    }
}