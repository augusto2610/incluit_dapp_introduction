// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./Service.sol";

contract Cobranzas {

    // Tiene un admin que puede recibir eth
    address payable public admin;

    // Tiene una instancia del contrato Service
    Service private service;

    // Evento para indicar que se recibio el deposito
    event EtherReceived(uint value);

    // En el constructor se guarda el admin y se inicializa la instancia del contrato Service.
    constructor() payable {
        admin = payable(msg.sender);

        // En este momento se hace un "deploy" del contrato Service y pasa a tener un address y balance.
        service = new Service();
    }

    // Mediante esta funcion desde remix vamos a enviar eth para esta prueba.
    function deposit() public payable {
        emit EtherReceived(msg.value);
    }

    // Muestra el address del contrato Service.
    function showServiceAddress() public view returns (address) {
        return service.getAddress();
    }

    // Esta funcion realiza una transferencia de eth hacia el contrato Service.
    // los ethers salen del balance del contrato Cobranzas, no del balance del Admin ni de quien interactua con el contrato.
    function pay() public payable {
        require(address(this).balance >= 1000, "This contract has not enought eth to execute the payment");
        (bool sent, bytes memory data) = service.getAddress().call {
            value: 1000
        }("");
        require(sent, "Failed to send Ether");
    }

    // Esta funcion muestra el balance del contrato Service
    function serviceBalance() public view returns (uint) {
        return service.getBalance();
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getContractAddress() public view returns (address) {
        return address(this);
    }

    function getAdminBalance() public view returns (uint) {
        return admin.balance;
    }

}