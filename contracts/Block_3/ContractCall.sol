//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

//External Function Calls and Low-Level Calls In-Depth

contract ContractOne{

    mapping(address=>uint) public addressBalances;

    function deposit() public payable{
        addressBalances[msg.sender] += msg.value;
    }

    receive() external payable{
        deposit();
    }
}

contract ContractTwo{

    receive() external payable{}

    // function depositOnContractOne(address contractOne) public{
    //     ContractOne one = ContractOne(contractOne);
    //     one.deposit{value:10, gas:100000}();
    // }

    function depositOnContractOneUsingCall(address contractOne) public{
        bytes memory playload = abi.encodeWithSignature("deposit()");
        (bool success, ) = contractOne.call{value:10, gas:100000}(playload);
        require(success);
    }

    function depositOnContractOneUsingCallAndFallback(address contractOne) public{
        (bool success, ) = contractOne.call{value:10, gas:100000}("");
        require(success);
    }
}