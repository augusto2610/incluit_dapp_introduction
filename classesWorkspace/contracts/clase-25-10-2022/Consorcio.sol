// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Employee.sol";
import "./Tenant.sol";

contract Consorcio is Ownable {

    struct Service {
        string name;
        uint price;
    }

    Employee[] private employeeList;
    Tenant[] private tenantList;
    Service[] private serviceList;

    receive() external payable {}
    fallback() external payable {}

    function paySalaries() public {}

    function payAllServices() public {}

    function payService(uint index) public {}

    function showAddress() public view returns(address) {
        return address(this);
    }

    function addNewTenant() public {}

    function addNewEmployee() public {}

    function addNewService() public {}
}