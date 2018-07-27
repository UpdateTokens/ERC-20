var KeyValueStorage = artifacts.require("./KeyValueStorage.sol");
var StoreNumber = artifacts.require("./StorageState.sol");
var UpdateToken = artifacts.require("./UpdateToken.sol");
var UpdateTokenV2 = artifacts.require("./UpdateTokenV2.sol");
var StorageConsumer = artifacts.require("./StorageConsumer.sol");
var OwnableContract = artifacts.require("./Ownable.sol"); //ok
var SafeMathContract = artifacts.require("./SafeMath"); //ok
var ProxyContract = artifacts.require("./Proxy");
var StorageStateful = artifacts.require("./StorageStateful");

module.exports = function(deployer) {

  deployer.deploy(OwnableContract);
  deployer.deploy(SafeMathContract);

  deployer.deploy(UpdateToken).then(function() {

    deployer.deploy(UpdateTokenV2).then(function() {
        deployer.deploy(StorageConsumer,KeyValueStorage.address).then(function(){
          deploy.deploy(StorageStateful);
        });
    });
  });
  

   //console.log(KeyValueStorage.address);
 deployer.deploy(StoreNumber,KeyValueStorage.address).then(function(){
    StoreNumber.deployed().then(function(sn){
        console.log(sn.address);
        console.log(sn.address);
        console.log(sn.address);

  });
}); 


};


