// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./BaseUser.sol";


contract Employee is BaseUser {

    string private profession;
    string private schedule;

    constructor(string memory newName, address newAddress, string memory newProfession, string memory newSchedule) BaseUser(newName, newAddress) {
        profession = newProfession;
        schedule = newSchedule;
    }

}