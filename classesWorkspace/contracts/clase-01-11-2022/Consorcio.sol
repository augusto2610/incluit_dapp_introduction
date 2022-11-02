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

    Employee private aEmployee;
    Tenant private aTenant;

    modifier isEnoughBalance(uint amount) {
        require(address(this).balance >= amount, "Insufficient funds");
        _;
    }

    event SalariesPaidSuccessfully();
    event ServicesPaidSuccessfully();
    event ServiceCreated(string service);

    receive() external payable {}
    fallback() external payable {}
    constructor() payable {}

    function paySalaries() public onlyOwner isEnoughBalance(calculateSalariesToPay()) {
        for (uint i; i < employeeList.length; i++) {
            transferToAddress(address(employeeList[i]), employeeList[i].getSalary());
        }
        emit SalariesPaidSuccessfully();
    }

    ///Esta funcion recorre el array y calcula el total de salarios a pagar
    function calculateSalariesToPay() private view returns(uint) {
        uint totalWages = 0;
        for(uint i; i < employeeList.length; i++) {
            totalWages += employeeList[i].getSalary();
        }
        return totalWages;
    }

    function transferToAddress(address toTransfer, uint amount) private {
        (bool sent, ) = toTransfer.call {
            value: amount
        }("");

        require (sent == true, "Transaction cannot be sent");
    }

    function payAllServices() public onlyOwner {
        uint amount = calculateServicesToPay();
        payAllServices(amount);
    }

    function payAllServices(uint amount) private isEnoughBalance(calculateServicesToPay()) {
        transferToAddress(getDeathAddresss(), amount);
        emit ServicesPaidSuccessfully();
    }

    function calculateServicesToPay() private view returns(uint) {
        uint servicesAmount = 0;
        for (uint i; i < serviceList.length; i++) {
            servicesAmount += serviceList[i].price;
        }
        return servicesAmount;
    }

    function payService(uint index) public {}

    function addNewService(string memory serviceName, uint price) public {
        Service memory service = Service(serviceName, price);
        serviceList.push(service);
        emit ServiceCreated(service.name);
    }

    function showAddress() public view returns(address) {
        return address(this);
    }

    /*
    * @notice esta funcion simplemente crea un nuevo objeto Tenant y lo guarda en la variable de estado aTenant.
    */
    function addNewTenant() public onlyOwner {
        /// TODO(5): Modificar esta funcion para que los parametros esperados no esten hardcodeados y se envien desde remix
        /// TODO(6): Modificar esta funcion para que cada vez que se crea un nueto Tenant se agregue al array tenantList
        aTenant = new Tenant("Nahuel", 0x583031D1113aD414F02576BD6afaBfb302140225, 200000, "test", address(this));
    }

    function depositTenant() public payable {
        (bool sent, ) = aTenant.getAddress().call {
            value: msg.value
        }("");

        require (sent == true, "Tenant no pudo recibir");
    }

    /*  
    * @notice esta funcion simplemente crea un nuevo objeto Employee y lo guarda en la variable de estado aEmployee.
    */
    function addNewEmployee(uint salary) public {
        /// TODO(7): Modificar esta funcion para que los parametros esperados no esten hardcodeados y se envien desde remix
        /// TODO(8): Modificar esta funcion para que cada vez que se crea un nueto Employee se agregue al array employeeList
        aEmployee = new Employee("Augusto", 0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC, "asdas", "asdasdas", salary);
        employeeList.push(aEmployee);
    }

    function depositEmployee() public payable {
        (bool sent, ) = aEmployee.getAddress().call {
            value: msg.value
        }("");

        require (sent == true, "Employee no pudo recibir");
    }

    function tenantWithdrawal() public {
        aTenant.withdrawal(100000);
    }

    function getDeathAddresss() private pure returns(address) {
        return 0x0000000000000000000000000000000000000000;
    }
}