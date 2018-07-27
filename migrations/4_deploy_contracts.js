var KeyValueStorage = artifacts.require("./KeyValueStorage.sol");
var StoreNumber = artifacts.require("./StorageState.sol");
var UpdateToken = artifacts.require("./UpdateToken.sol");
var UpdateTokenV2 = artifacts.require("./UpdateTokenV2.sol");
var StorageConsumer = artifacts.require("./StorageConsumer.sol");
var OwnableContract = artifacts.require("./Ownable.sol"); //ok
var SafeMathContract = artifacts.require("./SafeMath"); //ok
var ProxyContract = artifacts.require("./Proxy");

module.exports = function(deployer) {

deployer.deploy(ProxyContract,KeyValueStorage.address,OwnableContract.address).then(function(pro) {
      pro.upgradeTo(UpdateToken.address[1]);
    })
         
         // console.log(ProxyContract.address);
        //  });

        //Set bool voor alle contracten op true
KeyValueStorage.deployed().then(function(kl) {
  kl.setBool(StoreNumber.address, true);
  kl.setBool(UpdateToken.address, true);
  kl.setBool(StorageConsumer.address, true);
  kl.setBool(ProxyContract.address, true);
  kl.setBool(StorageStateful.address, true);
  kl.setBool(0x34E4Bc16af41D6ed2ecd9926Ad95799217039663, true);

  });
 
};


