// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constants {

    // variable
    uint public counter;

    // constante
    uint constant public RANDOM_NUMBER = 128121;

    // immutable
    uint immutable public OTHER_RANDOM_NUMBER;

    uint public example = 1 wei;
    uint public exampleEther = 1 ether;

    constructor() {
        OTHER_RANDOM_NUMBER = 1234678;
    }

    // la funcion es pure porque la funcion NO lee ni modifica ninguna variable de estado.
    function getRandom() external pure returns (uint) {
        return RANDOM_NUMBER;
    }

    function changeStatus() public {
        counter += 1;
    } 

}