//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

/*
1)Modifiers in solidity:
public - all contracts
private - only contract, where object was defined
internal - contract and derived contracts
external - external function can be called only outside the contract and cant be called inside.
external modifier can't be used with variables
https://mdjamilkashemporosh.medium.com/modifiers-in-solidity-public-private-internal-and-external-764d0aae9c
2)Inheritance
https://www.geeksforgeeks.org/solidity-inheritance/
*/

contract Inheritance{

    C contractC = new C();  
   
    function testInheritance() public returns(string memory, uint) {  
        contractC.setA();  
        contractC.setB();  
        return (contractC.getStr(), contractC.getPow());  
    }  
}

contract A { 
 
    string internal x;
 
    function setA() external {
        x = "GeeksForGeeks";
    }
}
 
contract B {  

    uint internal pow;  
 
    function setB() external {  
        uint a = 2;
        uint b = 20;
        pow = a ** b;
         
    }
}  
 
contract C is A, B {  
 
    function getStr() external view returns(string memory) {  
        return x;  
    } 
   
    function getPow() external view returns(uint) {  
        return pow;  
    }  
}  
