// require("dotenv").config();
// require("babel-register");
// require("babel-polyfill");

// const HDWalletProvider = require("truffle-hdwallet-provider");

// const providerWithMnemonic = (mnemonic, rpcEndpoint) =>
//   new HDWalletProvider(mnemonic, rpcEndpoint);

// const infuraProvider = network =>
//   providerWithMnemonic(
//     process.env.MNEMONIC || "",
//     `https://${network}.infura.io/${process.env.INFURA_API_KEY}`
//   );

// const ropstenProvider = process.env.SOLIDITY_COVERAGE
//   ? undefined
//   : infuraProvider("ropsten");

// const rinkebyProvider = infuraProvider("rinkeby");
// const mainnetProvider = infuraProvider("mainnet");
module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*", // eslint-disable-line camelcase
      gasPrice: 10000000000
    },
    ropsten: {
      provider: "localhost", //ropstenProvider
      network_id: 3 // eslint-disable-line camelcase
    },
    coverage: {
      host: "localhost",
      network_id: "*", // eslint-disable-line camelcase
      port: 8555,
      gas: 0xfffffffffff,
      gasPrice: 0x01
    },
    testrpc: {
      host: "localhost",
      port: 8545,
      network_id: "*" // eslint-disable-line camelcase
    },
    ganache: {
      host: "localhost",
      port: 7545,
      network_id: "*" // eslint-disable-line camelcase
    },
    rinkeby: {
      provider: "localhost", //rinkebyProvider,
      network_id: 4,
      gasPrice: 10000000000//25000000000
    },
    mainnet: {
      provider: "localhost", //mainnetProvider
      network_id: 1,
      gasPrice: 10000000000//25000000000 
    }
  }
};