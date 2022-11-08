var SquadContract = artifacts.require("Squad");

module.exports = function(_deployer) {
  _deployer.deploy(SquadContract, "Real Madrid");
};