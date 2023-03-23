require("./scripts/task.js")
var crypto = require('crypto');

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
      chainId: 1337,
      mining: { // Mines a new block every 5 seconds
        auto: true
        //interval: 5000
      },
      accounts:
        [
          {
            privateKey: crypto.randomBytes(32).toString('hex'),
            balance: "1000000000000000000000" //1 000 ETH
          }
        ]
    }
  },
  solidity: {
    compilers: [{
      version: "0.8.19",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200,
        },
      },
    },
    {
      version: '0.5.3',
      settings: {
        optimizer: {
          enabled: true,
          runs: 200,
        },
      },
    },
    {
      version: '0.6.12',
      settings: {
        optimizer: {
          enabled: true,
          runs: 200,
        },
      },
    },
  ]
  },
};
