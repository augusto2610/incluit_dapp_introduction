var MyContract = artifacts.require("ContratoClase");

module.exports = function(deployer) {
    deployer.deploy(MyContract, "");
}