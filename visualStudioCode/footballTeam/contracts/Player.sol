// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Player {
    string private name;
    string private position;
    uint256[] private ratings;
    uint256 private averageRating;
    uint256 private price;

    event RateAdded(uint256 rate);

    constructor(
        string memory playerName,
        string memory playerPos,
        uint256 marketPrice
    ) {
        name = playerName;
        position = playerPos;
        price = marketPrice;
    }

    function addNewRate(uint256 newRate) public {
        ratings.push(newRate);
        calculateAverageRate();
        emit RateAdded(newRate);
    }

    function getAverageRating() public view returns (uint256) {
        return averageRating;
    }

    function getRatings() public view returns (uint256[] memory) {
        return ratings;
    }

    // Otra forma de hacer esto podria ser mediante una variable de estado que sea el contador o acumulador
    function calculateAverageRate() private {
        uint256 amount = 0;
        for (uint256 i = 0; i < ratings.length; i++) {
            amount += ratings[i];
        }
        averageRating = amount / ratings.length;
    }

    function getMarketPrice() public view returns(uint) {
      return price;
    }
}
