var KeyValueStorageContract = artifacts.require("./KeyValueStorage.sol");

module.exports = function(deployer) {
   deployer.deploy(KeyValueStorageContract);
};

