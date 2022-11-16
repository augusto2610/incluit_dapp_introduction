// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Player {
    string private name;
    string private position;
    uint256[] private ratings;
    uint256 private averageRating;
    uint256 private mktPrice;

    event RatingAdded(uint256 rating);

    constructor(
        string memory playerName,
        string memory playerPosition,
        uint256 playerPrice
    ) {
        name = playerName;
        position = playerPosition;
        mktPrice = playerPrice;
    }

    function getMarketPrice() public view returns (uint256) {
        return mktPrice;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function addNewRating(uint256 rating) public {
        ratings.push(rating);
        calculateAvgRating();
        emit RatingAdded(rating);
    }

    function getAverageRating() public view returns (uint256) {
        return averageRating;
    }

    function getRatingsList() public view returns (uint256[] memory) {
        return ratings;
    }

    function calculateAvgRating() private {
        uint256 counter = 0;
        for (uint256 i; i < ratings.length; i++) {
            counter += ratings[i];
        }
        averageRating = counter / ratings.length;
    }
}
