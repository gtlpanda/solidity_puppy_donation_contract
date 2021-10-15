const {
  hexStripZeros
} = require("@ethersproject/bytes");
const hre = require("hardhat");
const main = async () => {
  const donationContractFactory = await hre.ethers.getContractFactory('puppyDonations');
  const donationContract = await donationContractFactory.deploy();
  await donationContract.deployed();
  // console.log('Contract addy:', donationContract.address);

  // const donationTxn = await donationContract.getAddresses();
  // await donationTxn.wait();

  // console.log(donationTxn);

};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();