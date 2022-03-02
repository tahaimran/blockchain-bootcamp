require('babel-register');
require('babel-polyfill');
require('dotenv').config();

module.exports = {

  networks: {
   development: {
     host: "127.0.0.1",
     port: 7545,
     network_id: "*"
   },
  },
contracts_directory: './src/contracts',
contracts_build_directory:'./src/abis',

  // Configure your compilers
  compilers: {
    solc: {
      version: "^0.8.10",
      optimizer: {
        enabled: true,
        runs: 200
      } 
    } 
  },

};
