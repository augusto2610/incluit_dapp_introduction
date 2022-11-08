// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Player.sol";

contract Squad is Ownable {
    string private name;
    Player[] private players;

    event FundsReceived(uint256 amount);
    event PlayerAquired();

    receive() external payable {
        emit FundsReceived(msg.value);
    }

    fallback() external payable {
        emit FundsReceived(msg.value);
    }

    constructor(string memory squadName) {
        name = squadName;
    }

    function addNewPlayer(
        string memory playerName,
        string memory playerPos,
        uint256 marketPrice
    ) public onlyOwner {
        Player player = new Player(playerName, playerPos, marketPrice);
        players.push(player);
    }

    function buyPlayer(address sellerAddress, Player newPlayer)
        public
        onlyOwner
    {
        require(
            address(this).balance >= newPlayer.getMarketPrice(),
            "El equipo no tiene fondos suficientes"
        );
        (bool sent, ) = sellerAddress.call{value: newPlayer.getMarketPrice()}(
            ""
        );
        require(sent, "Error en la transferencia");
        players.push(newPlayer);
        emit PlayerAquired();
    }

    function getPlayers() public view returns (Player[] memory) {
        return players;
    }

    function getSquadName() public view returns (string memory) {
        return name;
    }

    function getDreamTeam() public {}

    function sellPlayer() public {}
}
