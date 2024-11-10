//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;
/*
1)require returns an Error, assert - Panic. The last catch-block is for custom-exceptions.
2)Exception handling allows us not to break the transaction, transaction will be mined and in logs we can find 
the message.
*/
contract Exceptions_TryCatch{

    error NotAllowedError(string);

    function aFunction() public pure{
        // require(false, "Exception");
        // assert(false);
        revert NotAllowedError("You are not allowed!");
    }
}

contract ErrorHandling{
    
    event ErrorLogging(string reason);
    event ErrorLogCode(uint errorCode);
    event ErrorLogBytes(bytes lowLevelData);

    function catchTheError() public{
        Exceptions_TryCatch ex = new Exceptions_TryCatch();
        try ex.aFunction(){

        }catch Error (string memory reason){
            emit ErrorLogging(reason);
        }catch Panic (uint errorCode){
            emit ErrorLogCode(errorCode);
        }catch(bytes memory lowLevelData){
            emit ErrorLogBytes(lowLevelData);
        }
    }
}