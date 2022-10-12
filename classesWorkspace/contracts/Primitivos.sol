// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Primitivos {

    bool public boo = true;

    int public i;
    
    int8 public i8 = 1;
    int128 public i128;

    uint public ui = 569;
    uint256 public uintero = 569;

    int public maxint = type(int).max;
    int public minint = type(int).min;

    address public add = 0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B;

    constructor() {
        i = 10;
        i8 = 20;
    }


}