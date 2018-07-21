var UpdateToken = artifacts.require("./UpdateToken.sol");
var ProxyContract = artifacts.require("./Proxy.sol");
var OwnableContract = artifacts.require("./Ownable.sol");
var SafeMathContract = artifacts.require("./SafeMath");
var KeyValueStorageContract = artifacts.require("./KeyValueStorage.sol");
var InfoContract = artifacts.require("./Info.sol");
var StorageStateContract = artifacts.require("./StorageState.sol");


module.exports = function(deployer) {

module.exports = function(deployer) {


   //deployer.deploy(OwnableContract).then( ()=>{ deployer.deploy(SafeMathContract); });
   //deployer.deploy(InfoContract).then( ()=>{ deployer.deploy(StorageStateContract); }); 
   deployer.deploy(ProxyContract);
   deployer.deploy(SafeMathContract);
   deployer.deploy(InfoContract);
   deployer.deploy(StorageStateContract);

   deployer.link(OwnableContract, SafeMathContract, InfoContract);

  deployer.deploy(UpdateToken, KeyValueStorageContract.address).then(() => {
    KeyValueStorageContract.deployed().then(inst => {
     return inst.allowAcces(UpdateToken.address);
   });
  });

  const delegateV1 = UpdateToken.new()
  ProxyContract.upgradeTo(delegateV1.address)

  ProxyContract = _.extend(ProxyContract,UpdateToken.at(ProxyContract.address));

};

};

// var OwnableContract = artifacts.require("./Ownable.sol");
// var SafeMathContract = artifacts.require("./SafeMath");
// var InfoContract = artifacts.require("./Info.sol");

// deployer.deploy(OwnableContract);
// deployer.deploy(SafeMathContract);
// deployer.deploy(InfoContract);

//const KeyValueStorage = artifacts.require('KeyValueStorage.sol')
// const UpdateTokenContract = artifacts.require('UpdateToken')
// const DelegateV2 = artifacts.require('UpdateTokenV2')
// const Proxy = artifacts.require('Proxy')

// contract('Storage and upgradability example', async (accounts) => {
//   it('should create and upgrade idap token', async () => {
//     const keyValueStorage = await KeyValueStorage.new()
//     let proxy = await Proxy.new(keyValueStorage.address,accounts[2])
//     const delegateV1 = await UpdateTokenContract.new()
//     const delegateV2 = await UpdateTokenV2.new()
    
//     await proxy.upgradeTo(delegateV1.address)

//     proxy = _.extend(proxy,UpdateTokenContract.at(proxy.address));

     
    
//    await proxy.setNumberOfOwners(10);
//   let numOwnerV1 = await proxy.getNumberOfOwners();
//   console.log(numOwnerV1.toNumber())
  
//    await proxy.upgradeTo(UpdateTokenV2.address);
  
//    proxy = DelegateV2.at(proxy.address);
//    let previousOwnersState = await proxy.getNumberOfOwners();
//    console.log(previousOwnersState.toNumber());
//    await proxy.setNumberOfOwners(20,{from:accounts[2]});
  
//    let numOfownersV2 = await proxy.getNumberOfOwners();
//    console.log(numOfownersV2.toNumber());
    
   



    
  
   
   
//});
//});
