//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

contract Enums{
    
    //namely this structure is used for defining enums
    enum ActionChoices {GoLeft, GoRight, GoForward, GoBack} 
    ActionChoices choice;
    ActionChoices constant defaultChoise = ActionChoices.GoRight;

    function getChoice() public view returns (ActionChoices) {
      return choice;
   }
}