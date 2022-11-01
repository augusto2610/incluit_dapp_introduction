const ContratoClaseTests = artifacts.require("ContratoClase");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("ContratoClaseTests", function (/* accounts */) {
  it("should assert true", async function () {
    await ContratoClaseTests.deployed();
    return assert.isTrue(true);
  });
});
