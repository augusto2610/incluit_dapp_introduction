// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract CustomCounter {

    uint private contador;

    // funcion para obtener el estado actual del contador
    function getContador() public view returns (uint) {
        return contador;
    }

    // funcion para sumar el contador
    function sumar() public {
        contador += 1;
    }

    // funcion para restar el contador
    function restar() public {
        // si el contador es 0, cuando se le quiera restar uno va a lanzar una excepcion y va a haber un revert en la ejecucion del contrato.
        contador -= 1;
    }

}