const Squad = artifacts.require("Squad");
//const utils = require("./helpers/utils");
let contract;

contract("Squad", function (accounts) {
  beforeEach(async () => {
    contract = await Squad.deployed();
  });

  it("addNewPlayer should add the Player to list", async function () {
    //Set up: Inicializar variables
    //In BeforeEach

    //Act: Ejecutar
    await contract.addNewPlayer(
      "Cristiano Ronaldo",
      "DEL",
      200000
    );

    let players = await contract.getPlayers();

    //Assert: Comprobar datos
    assert.equal(players.length, 1, "El tamanio de la lista deberia ser 1");
  });

  it("addNewPlayer should be called by the owner", async function () {
    //Set up: Inicializar variables
    //In BeforeEach

    //Act: Ejecutar

    //TODO: Este test lo terminaremos la proxima clase
  });

});
