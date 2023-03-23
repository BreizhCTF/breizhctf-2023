// Flag return here or in the netcat script ? 



//require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-ethers");
const fs = require('fs');
const util = require("./util")
const helpers = require("@nomicfoundation/hardhat-network-helpers");

////////////////////////////////////////////// Deploy blockchain-101 //////////////////////////////////////////////
//npx hardhat --network localhost blockchain-101_deploy
task("blockchain-101_deploy", "deploy blockchain-101 challenge")
  .setAction(async (taskArgs) => {
    try{
      const Contract = await ethers.getContractFactory("Bienvenue");
      const contract = await Contract.deploy();

      await contract.deployed();

      console.log(contract.address)

    }catch (err){
      console.log("Error");
    }
  });


////////////////////////////////////////////// Deploy randomGame //////////////////////////////////////////////
//npx hardhat --network localhost randomGame_deploy
task("randomGame_deploy", "deploy randomGame challenge")
  .setAction(async (taskArgs) => {
    try{
      const Contract = await ethers.getContractFactory("RandomGame");
      const _amount = ethers.utils.parseEther("10");
      const contract = await Contract.deploy({ value: _amount });

      await contract.deployed();

      console.log(contract.address)
    }catch (err){
      console.log(err);
    }
  });

////////////////////////////////////////////// Deploy chateau //////////////////////////////////////////////
//npx hardhat --network localhost chateau_deploy
task("chateau_deploy", "deploy chateau challenge")
  .setAction(async (taskArgs) => {
    try{
      const Contract = await ethers.getContractFactory("ChateauDeKeriolet");
      const contract = await Contract.deploy();

      await contract.deployed();

      console.log(contract.address)
    }catch (err){
      console.log(err);
    }
  });

////////////////////////////////////////////// Deploy lucky //////////////////////////////////////////////
//npx hardhat --network localhost lucky_deploy
task("lucky_deploy", "deploy lucky challenge")
  .setAction(async (taskArgs) => {
    try{
      const Contract = await ethers.getContractFactory("Lucky");
      const contract = await Contract.deploy();

      await contract.deployed();

      console.log(contract.address)

    }catch (err){
      console.log("Error");
    }
    
  });


////////////////////////////////////////////// Deploy mutablePotion //////////////////////////////////////////////
//npx hardhat --network localhost mutablePotion_deploy
task("mutablePotion_deploy", "deploy mutablePotion challenge")
.setAction(async (taskArgs) => {
  try{
    const Contract = await ethers.getContractFactory("MutablePotion");
    const contract = await Contract.deploy();

    await contract.deployed();

    console.log(contract.address)
  }catch (err){
    console.log("Error");
  }
  
});


////////////////////////////////////////////// Deploy broceliande //////////////////////////////////////////////
//npx hardhat --network localhost broceliande_deploy
task("broceliande_deploy", "deploy broceliande challenge")
.setAction(async (taskArgs) => {
  try{
    const Druid = await ethers.getContractFactory("Druid");
    const Getafix = await ethers.getContractFactory("Getafix");

    const druid = await Druid.deploy();
    await druid.deployed();

    const _amount = ethers.utils.parseEther("10");

    const getafix = await Getafix.deploy(druid.address,{ value: _amount });
    await getafix.deployed();

    console.log(getafix.address)
  }catch (err){
    console.log("Error");
  }
});



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////// isSolve blockchain-101 //////////////////////////////////////////////
//npx hardhat --network localhost blockchain-101_isSolve --addresschallenge addr
task("blockchain-101_isSolve", "check if blockchain-101 instance is solved")
  .addParam("addresschallenge", "The instance address")
  .setAction(async (taskArgs) => {
    try {

      const Contract = await ethers.getContractFactory("Bienvenue");
      const contract = await Contract.attach(
        taskArgs.addresschallenge // The deployed contract address
      );

      let solved = await contract.solved();
      if(solved == true){
        console.log("BZHCTF{HellO_wOrld}");
      }else{
        console.log("Try Again");
      }
    } catch (err) {
      console.log("Error");
    }
  });


////////////////////////////////////////////// isSolve randomGame //////////////////////////////////////////////
//npx hardhat --network localhost randomGame_isSolve --addresschallenge addr
task("randomGame_isSolve", "check if randomGame instance is solved")
  .addParam("addresschallenge", "The instance address")
  .setAction(async (taskArgs) => {
    try {
      const Contract = await ethers.getContractFactory("RandomGame");
      const contract = await Contract.attach(
        taskArgs.addresschallenge // The deployed contract address
      );


      const balance = await ethers.provider.getBalance(contract.address);
      if(balance == 0){
        console.log("BZHCTF{Ho_yEAh_I'm_th3_r3A1_h4cker}");
      }else{
        console.log("Try Again");
      }
    } catch (err) {
      console.log("Error");
    }
  });

////////////////////////////////////////////// isSolve chateau //////////////////////////////////////////////
//npx hardhat --network localhost chateau_isSolve --addresschallenge addr
task("chateau_isSolve", "check if chateau instance is solved")
  .addParam("addresschallenge", "The instance address")
  .setAction(async (taskArgs) => {
    try {
      const Contract = await ethers.getContractFactory("ChateauDeKeriolet");
      const contract = await Contract.attach(
        taskArgs.addresschallenge // The deployed contract address
      );


      const door = await contract.door();
      if(door){
        console.log("BZHCTF{9o_SAvE_ThE_pr1NCEs5}");
      }else{
        console.log("Try Again");
      }
    } catch (err) {
      console.log("Error");
    }
  });

////////////////////////////////////////////// isSolve Lucky //////////////////////////////////////////////
//npx hardhat --network localhost lucky_isSolve --addresschallenge addr
task("lucky_isSolve", "check if lucky instance is solved")
  .addParam("addresschallenge", "The instance address")
  .setAction(async (taskArgs) => {
    try {

      const Contract = await ethers.getContractFactory("Lucky");
      const contract = await Contract.attach(
        taskArgs.addresschallenge // The deployed contract address
      );

      let solved = await contract.solved();
      if(solved == true){
        console.log("BZHCTF{hOw_90od_Is_gooD_1uCK}");
      }else{
        console.log("Try Again");
      }
    } catch (err) {
      console.log("Error");
    }
  });

////////////////////////////////////////////// isSolve mutablePotion //////////////////////////////////////////////
//npx hardhat --network localhost mutablePotion_isSolve --addresschallenge addr
task("mutablePotion_isSolve", "check if mutablePotion instance is solved")
  .addParam("addresschallenge", "The instance address")
  .setAction(async (taskArgs) => {

    try {
      const Contract = await ethers.getContractFactory("MutablePotion");
      const contract = await Contract.attach(
        taskArgs.addresschallenge // The deployed contract address
      );

      let potionAllowed  = await contract.potionAllowed();
      if(potionAllowed == true){
        console.log("BZHCTF{NOt_so_1MMu7AB13_:)}");
      }else{
        console.log("Try Again");
      }
    } catch (err) {
      console.log("Error");
    }
  });

////////////////////////////////////////////// isSolve broceliande //////////////////////////////////////////////
//npx hardhat --network localhost broceliande_isSolve --addresschallenge addr
task("broceliande_isSolve", "check if broceliande challenge is solved")
  .addParam("addresschallenge", "The instance address")
  .setAction(async (taskArgs) => {

    try {
      const Contract = await ethers.getContractFactory("Getafix");
      const contract = await Contract.attach(
        taskArgs.addresschallenge // The deployed contract address
      );

      const balance = await ethers.provider.getBalance(contract.address);
      if(balance == 0){
        console.log("BZHCTF{4NywAy_I_preFEr_aST3rix}");
      }else{
        console.log("Try Again");
      }
    } catch (err) {
      console.log("Error");
    }
  });



////////////////////////////////////////////// FAUCET //////////////////////////////////////////////
//npx hardhat --network localhost faucet --address addr
task("faucet", "give eth to player")
  .addParam("address", "The address to receive a token")
  .setAction(async (taskArgs) => {
    if (!util.checkaddr(taskArgs.address)) { 
      console.log("Adresse non conforme");
      return false 
    }
    //console.log(taskArgs.address);
    await helpers.setBalance(taskArgs.address, (10n ** 18n) * 10n);
    console.log("Balance of " + taskArgs.address + " set to " + ethers.utils.formatEther(await ethers.provider.getBalance(taskArgs.address)) + " ethers");
  });
