//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

/*
1)with super child contract can call original function fro parent contract, when this functin is already 
overriden in child contract.
https://heysourin.medium.com/super-keyword-in-solidity-f56d75909282
2)function wihich you want to override must be marked as virtual. Hence the function which overrides
another function must be marked as everride. One function can have override and virtual marks at 
the same time.
*/

contract Override{
    Child child  = new Child();

    function testOverride() public{
        child.printMessage();
    }
}

contract Parent {
    event Message(string);
    function printMessage() public virtual{
        emit Message("Hello from Parent!");
    }
}

contract Child is Parent {
    function printMessage() public override{
        super.printMessage();
        emit Message("Hello from Child!");
    }
}