const Squad = artifacts.require("Squad");
const Player = artifacts.require("Player");
const utils = require("./helpers/utils");

contract("Squad", function (accounts) {
  let contract;
  //Es el address que deployo el contrato
  const [alice, bob] = accounts;

  beforeEach(async () => {
    //En tests debemos usar .new() porque necesitamos una nueva instancia por cada test
    contract = await Squad.new("Real Madrid");
  });

  context("function: addNewPlayer", async function () {
    it("should add the Player to list", async function () {
      //Set up: Inicializar variables
      //In BeforeEach

      //Act: Ejecutar
      await contract.addNewPlayer(
        "Cristiano Ronaldo",
        "DEL",
        200000,
        { from: alice }
      );

      let players = await contract.getPlayers();

      //Assert: Comprobar datos
      assert.equal(players.length, 1, "El tamanio de la lista deberia ser 1");
    });

    it("should fail if the caller is not the owner", async function () {
      let notOwner = bob;

      await utils.shouldThrow(
        contract.addNewPlayer(
          "Cristiano Ronaldo",
          "DEL",
          200000,
          { from: notOwner }
        )
      )
    });

    it("should be call by owner", async function () {
      let owner = alice;

      await contract.addNewPlayer(
        "Cristiano Ronaldo",
        "DEL",
        200000,
        { from: owner }
      )

      assert(true);
    });
  });

  context("function: buyPlayer", async function () {
    it("should add the newPlayer to the list", async function () {
      //Set up
      let ownerOfPlayer = bob;
      let newPlayer = await Player.new("Messi", "DEL", 2);
      let contractBalance = 1;

      await web3.eth.sendTransaction({ to: contract.address, from: bob, value: web3.utils.toWei(contractBalance.toString(), "ether") });
      //Act
      await contract.buyPlayer(
        ownerOfPlayer,
        newPlayer.address
      )

      let players = await contract.getPlayers();
      assert(players.length, 1, "Player list should be 1");
    });
    it("should emit event PlayerAquired", async function () {
      //Set up
      let ownerOfPlayer = bob;
      let newPlayer = await Player.new("Messi", "DEL", 2);
      let contractBalance = 1;

      await web3.eth.sendTransaction({ to: contract.address, from: bob, value: web3.utils.toWei(contractBalance.toString(), "ether") });
      //Act
      let tx = await contract.buyPlayer(
        ownerOfPlayer,
        newPlayer.address
      )

      let log = tx.logs[0];

      //Assert
      assert.equal(log.event, "PlayerAquired");
    })

    it("should emit event PlayerAquired with price", async function () {
      //Set up
      let ownerOfPlayer = bob;
      let playerPrice = 2;
      let newPlayer = await Player.new("Messi", "DEL", playerPrice);
      //Ether
      let contractBalance = 1;

      await web3.eth.sendTransaction({ to: contract.address, from: bob, value: web3.utils.toWei(contractBalance.toString(), "ether") });
      //Act
      let tx = await contract.buyPlayer(
        ownerOfPlayer,
        newPlayer.address
      )
      let log = tx.logs[0];

      //Assert
      assert.equal(log.args.price.toString(), playerPrice.toString());
    })

    it("should fail if the balance is minor than price", async function () {
      //Set up
      let ownerOfPlayer = bob;
      let playerPrice = 9999999;
      //Wei
      let contractBalance = 1;
      let newPlayer = await Player.new("Messi", "DEL", playerPrice);
      //Send ethers to contract
      await web3.eth.sendTransaction({ to: contract.address, from: bob, value: web3.utils.toWei(contractBalance.toString(), "wei") });

      await utils.shouldThrow(
        contract.buyPlayer(
          ownerOfPlayer,
          newPlayer.address
        )
      )
    });
  });

});
