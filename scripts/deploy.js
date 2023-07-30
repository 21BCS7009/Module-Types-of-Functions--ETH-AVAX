// This is a script for deploying your contracts. You can adapt it to deploy
// yours, or create new ones.


const hre = require("hardhat");
const path = require("path");

async function main() {
  const Token = await hre.ethers.getContractFactory("Token");
  const token = await Token.deploy();
  await token.deployed();

  console.log("Token address:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });