//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

/*
1)Deploy CoffeeToken contract, deploy TokenSaleProject passing CoffeeToken contract address to the 
constructor.
2)Mint some tokens for the owner and give allowance to the TokenSaleProject to spend money from
tokenOwner address.
3)Now you can purchase tokenOwner tokens using TokenSaleProject contract.
*/

abstract contract ERC20{
    function transferFrom(address _from, address _to, uint256 _value) public virtual returns (bool success);
    function decimals() public view virtual returns (uint8);
}

contract TokenSaleProject{

    uint tokenPriceInWei = 1 ether;

    ERC20 public token;
    address public tokenOwner;

    constructor(address _token){
        tokenOwner = msg.sender;
        token = ERC20(_token); 
    }

    function purchaseCoeffee() public payable {
        require(msg.value >= tokenPriceInWei, "Not enough token sent");
        uint tokensToTransfer = msg.value/tokenPriceInWei;
        uint remainder = msg.value - tokensToTransfer * tokenPriceInWei;
        token.transferFrom(tokenOwner, msg.sender, tokensToTransfer * 10 ** token.decimals());
        payable(msg.sender).transfer(remainder);
    }
}