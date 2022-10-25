// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./BaseUser.sol";

contract Tenant is BaseUser {

    uint private servicePrice;
    string private buildingAddress;
    address private consorcioAddress;

    event ExpensesPaid(uint pricePaid);
    event EtherReceived(uint amount);

    receive() external payable {}
    fallback() external payable {}

    constructor (
        string memory name,
        address newWithdraAddress,
        uint price,
        string memory newBuildingAdd, 
        address newConsorcioAdd
    ) payable BaseUser (name, newWithdraAddress)  {
        
        servicePrice = price;
        buildingAddress = newBuildingAdd;
        consorcioAddress = newConsorcioAdd;
    }

    function deposit() public payable {
        emit EtherReceived(msg.value);
    }

    function payExpenses() public {
        require(address(this).balance >= servicePrice, "Fondos insuficientes");
        (bool sent,) = consorcioAddress.call {
            value: servicePrice
        }("");
        require(sent == true, "Fallo la transferencia");
        emit ExpensesPaid(servicePrice);
    }

}   