//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.26;

/*
1)This script is like a web3 coeffee maschine. When you want to order a coeffee, you need to scan 
your MM from your phone and enter amount of coeffee cups, which you want to purchase. Coeffee maschine
at that time is listening on the blockchain for some events, and after event or in other words
payment confirmation is received from the blockchain, you will get a coeffee.
2)OpenZeppelin - website where you can use ready-built smart contracts.
*/

import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CoffeeToken is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    uint coeffeePrice = 1 ether;

    event CoffeePurchased(address indexed receiver, address indexed buyer);

    constructor(address defaultAdmin, address minter) ERC20("CoffeeToken", "CFE") {
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _grantRole(MINTER_ROLE, minter);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount * coeffeePrice);
    }

    function buzOneCoffee() public{
        _burn(_msgSender(), coeffeePrice);

        emit CoffeePurchased(_msgSender(), _msgSender());
    }

    function buyOneCoffeeFrom(address account) public{
        _spendAllowance(account, _msgSender(), coeffeePrice);
        _burn(account, coeffeePrice);

        emit CoffeePurchased(_msgSender(), account);
    }
}