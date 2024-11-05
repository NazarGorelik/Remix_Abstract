//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

contract MyContract{
    
    string public greetingString = "hello world nazar";

    function updategreetingString(string memory _updateString) public{
        greetingString = _updateString;
    }
}
