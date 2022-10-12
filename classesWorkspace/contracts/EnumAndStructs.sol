// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract EnumAndStructs {

    enum GameState {
        Iddle, // 0
        Play, // 1
        Pause, // 2
        GameOver, // 3
        Finished // 4
    }

    struct Game {
        uint level;
        bool isFinished;
        GameState state;
        string name;
    }

    GameState public gameState;

    Game public game;

    constructor() {
        gameState = GameState.GameOver;
        game = Game(1, false, GameState.Play, "FIFA 23");
    }

    function setState(GameState newStatus) private {
        gameState = newStatus;
    }

    function startGame() public {
        setState(GameState.Play);
    }

    function resetState() public {
        delete gameState;
    }

    function getGameLevel() public view returns (uint) {
        return game.level;
    }

    function sumar(uint i, uint j) public pure returns(uint) {
        return i + j;
    }

}