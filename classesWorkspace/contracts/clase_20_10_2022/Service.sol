// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Service {

    // Las funciones receive() y fallback() es una funcion nativa asi como lo es constructor.
    // Sin estas funciones el contrato no puede recibir eth
    receive() external payable {}
    fallback() external payable {}
    constructor() {}

    function getAddress() public view returns (address) {
        return address(this);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}