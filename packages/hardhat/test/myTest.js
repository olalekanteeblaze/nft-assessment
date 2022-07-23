const { ethers } = require("hardhat");
const { use, expect } = require("chai");
const { solidity } = require("ethereum-waffle");

use(solidity);

describe("My Dapp", function () {
  let myContract;

  // quick fix to let gas reporter fetch data from gas station & coinmarketcap
  before((done) => {
    setTimeout(done, 2000);
  });

  describe("NFTContract", function () {
    it("Should deploy YourContract", async function () {
      const YourContract = await ethers.getContractFactory("NFTContract");

      myContract = await YourContract.deploy();
    });

    describe("createToken", function () {
      it("Should be able to create toke", async function () {

        await myContract.createToken(newPurpose);
        expect(await myContract._tokenIds).to.equal(0);
      });

      it("Should emit a SetPurpose event ", async function () {
        const [owner] = await ethers.getSigners();

        expect(await myContract.createToken())
          .to.emit(myContract, "CreateToken")
          .withArgs(owner.address);
      });
    });
  });
});
