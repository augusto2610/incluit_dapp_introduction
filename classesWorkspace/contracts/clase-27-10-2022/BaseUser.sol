// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BaseUser {

    string private name;
    address private withdrawAddress;

    event WithdrawalSuccessful(uint addressBalance);
    event EtherReceived(uint amount, address tenantAddress, uint balance);

    receive() external payable {
        emit EtherReceived(msg.value, address(this), address(this).balance);
    }
    fallback() external payable {
        emit EtherReceived(msg.value, address(this), address(this).balance);
    }

    constructor(string memory newName, address newAddress) {
        name = newName;
        withdrawAddress = newAddress;
    }

    function withdrawal(uint amount) public {
        require(
            address(this).balance >= amount,
            "BaseUser: Balance insuficiente"
        );
        (bool success,) = withdrawAddress.call{value: amount}(
            ""
        );
        emit WithdrawalSuccessful(address(this).balance);
    }

    function getAddress() public view returns (address) {
        return address(this);
    }

}
