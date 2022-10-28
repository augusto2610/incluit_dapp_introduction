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

    receive() external payable {}
    fallback() external payable {}

    function paySalaries() public {
        ///TODO(2): Una vez completado el TODO(1), implementar esta funcion. 
        ///Esta funcion deberia recorrer el array y calcular el total de salarios a pagar,
        ///validar que tenga fondos suficientes y si es suficiente, realizar el pago de todos los salarios.
    }

    function payAllServices() public {
        ///TODO(4): Desarrollar la funcion para poder pagar todos los servicios, con las mismas condiciones
        ///que la funcion paySalaries()
    }

    function payService(uint index) public {}

    function addNewService() public {
        ///TODO(3): desarrollar la funcion para poder crear servicios y agregarlos al array serviceList
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
    function addNewEmployee() public {
        /// TODO(7): Modificar esta funcion para que los parametros esperados no esten hardcodeados y se envien desde remix
        /// TODO(8): Modificar esta funcion para que cada vez que se crea un nueto Employee se agregue al array employeeList
        aEmployee = new Employee("Augusto", 0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC, "asdas", "asdasdas");
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
}