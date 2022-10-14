// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract EventContract {
    event Log(string message, address sender);

    function emitLog(string memory message) public {
        emit Log(message, msg.sender);
    }
}