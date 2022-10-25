// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BaseUser {

    string private name;
    address private withdrawAddress;

    constructor(string memory newName, address newAddress) {
        name = newName;
        withdrawAddress = newAddress;
    }

    function withdrawal() public {
        // TODO: realizar transferencia hacia withdrawAddress
    }
}
