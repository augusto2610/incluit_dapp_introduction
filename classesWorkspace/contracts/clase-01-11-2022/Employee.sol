// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./BaseUser.sol";

contract Employee is BaseUser {

    uint private salary;
    string private profession;
    string private schedule;

    constructor(
        string memory newName, 
        address newAddress, 
        string memory newProfession, 
        string memory newSchedule,
        uint newSalary
    ) BaseUser(newName, newAddress) {
        profession = newProfession;
        schedule = newSchedule;
        salary = newSalary;
    }

    function getSalary() public view returns(uint) {
        return salary;
    }
}