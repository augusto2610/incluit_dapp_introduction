// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./Player.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Squad is Ownable {
    string private name;
    Player[] private players;

    event FundsReceived(uint256 amount);
    event PlayerAquired(string playerName);
    event PlayerSold(string playerName);

    modifier notOwner() {
        require(msg.sender != owner(), "The owner cannot execute this function");
        _;
    }

    receive() external payable {
        emit FundsReceived(msg.value);
    }

    fallback() external payable {
        emit FundsReceived(msg.value);
    }

    constructor(string memory clubName) {
        name = clubName;
    }

    function addNewPlayer(
        string memory plName,
        string memory position,
        uint256 mktPrice
    ) public {
        Player newPlayer = new Player(plName, position, mktPrice);
        players.push(newPlayer);
    }

    function buyPlayer(address addressToPay, Player newPlayer)
        public
        payable
        onlyOwner
    {
        require(
            address(this).balance >= newPlayer.getMarketPrice(),
            "The contract have not the enought balance"
        );

        (bool sent, ) = addressToPay.call{
            value: newPlayer.getMarketPrice()
        }("");
        require(sent == true, "Player cannot be bought");
    }

    function sellPlayer(uint playerIndex) public payable notOwner {
        require(playerIndex < players.length, "Index not found");
        Player playerToSell = players[playerIndex];
        
        require(msg.value == playerToSell.getMarketPrice(), "Funds not enough to make the transaction");
        
        for (uint i = playerIndex; i < players.length -1; i++) {
            players[i] = players[i+1];
        }
        // se puede hacer de esta forma pero el array pierde el orden.
        //players[playerIndex] = players[players.length-1];
        players.pop();
        
        emit PlayerSold(playerToSell.getName());
    }
    
    function getDreamTeam(uint baseLineRate) public view returns (Player[] memory) {
        uint dTeamCount;
        for (uint i = 0; i < players.length; i++) {
            if (players[i].getAverageRating() >= baseLineRate) {
                dTeamCount++;
            }
        }

        Player[] memory dTeam = new Player[](dTeamCount);
        //This is needed to put element in new array.
        uint j = 0;
        for (uint i = 0; i < players.length; i++) {
            if (players[i].getAverageRating() >= baseLineRate) {
                dTeam[j] = players[i];
                j++;
            }
        }

        return dTeam;
    }

    function getPlayers() public view returns (Player[] memory) {
        return players;
    }

    function addRatingToPlayer(uint index, uint8 rate) public {
        require(index < players.length, "Index not found.");
        players[index].addNewRating(rate);
    }
}
