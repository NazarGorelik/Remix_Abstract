//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

contract Consumer{
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function deposit() public payable{}
}

contract WalletProject{

    address payable public owner;

    mapping(address => uint) public allowance;
    mapping(address => bool) public isAllowedToSend;

    mapping(address => bool) public guardians;
    address payable public nextOwner;
    mapping(address => mapping(address=>bool)) public nextOwnerGuardianVotedBool;
    uint public guardiansResetCount;
    uint public constant confirmationsFromGuardiansForReset = 3;

    constructor(){
        owner = payable(msg.sender);
    }

    function setGuardian(address _guardian)public{
        require(msg.sender == owner, "You are not the owner, aborting");
        guardians[_guardian] = true;
    }

    //3 guardians must "vote" for the new owner to change the owner address in smart-contract
    function proposeNewOwner(address payable newOwner) public {
        require(guardians[msg.sender], "You are not guardian, aborting");
        require(nextOwnerGuardianVotedBool[newOwner][msg.sender] == false, "Yau have already voted");

        if(nextOwner != newOwner) {
            nextOwner = newOwner;
            guardiansResetCount = 0;
        }

        guardiansResetCount++;

        if(guardiansResetCount >= confirmationsFromGuardiansForReset) {
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    function setAllowance(address _for, uint _value) public{
        require(msg.sender == owner, "You are not the owner, aborting");
        allowance[_for] = _value;

        if(_value > 0){
            isAllowedToSend[_for] = true;
        }else{
            isAllowedToSend[_for] = true;
        }
    } 

    function transfer(address payable _to, uint _value, bytes memory _payload)public returns(bytes memory){
        if(msg.sender != owner){
            require(isAllowedToSend[msg.sender], "You are not allowed to send");
            require(allowance[msg.sender] >= _value, "you are trying to send more then you are allowed to");

            allowance[msg.sender] -= _value;

            if(allowance[msg.sender] == 0){
                    isAllowedToSend[msg.sender] = false;
            }
        }

        (bool success, bytes memory returnData) = _to.call{value: _value}(_payload);
        require(success, "Call was not successful");

        return returnData;
    }

    //so that out contract can receive funds
    receive() external payable{}
}