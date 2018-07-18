var UpdateToken = artifacts.require("./UpdateToken");
//var TestUpdateToken = artifacts.require("./TestUpdateToken");
//var ProxyContract = artifacts.require("./Proxy");
var OwnableContract = artifacts.require("./Ownable");
var SafeMathContract = artifacts.require("./SafeMath");
var KeyValueStorageContract = artifacts.require("./KeyValueStorage");
var StorageState = artifacts.require("./StorageState");
var Delegate1 = artifacts.require("./DelegateV1.sol");
var Delegate2 = artifacts.require("./DelegateV2.sol");

// contract('./UpdateToken.sol', ([owner, ...accounts]) => {
//   var instance
//   beforeEach('setup contract for each test', async () => {
//     instance = await UpdateToken.new()
//   })

//   it('should start with no tokens', async () => {
//     assert.equal(
//       (await instance.totalSupply()).toNumber(),
//       0,
//     )
//   })
// })

module.exports = function(deployer) {

   deployer.deploy(KeyValueStorageContract);
   deployer.deploy(Delegate1);
   deployer.deploy(Delegate2);
   deployer.deploy(StorageState);
   //deployer.deploy(ProxyContract)
   deployer.deploy(UpdateToken);
   //deployer.deploy(TestUpdateToken)
   deployer.deploy(OwnableContract)
   deployer.deploy(SafeMathContract)
  //deployer.link(Lib2, UpdateToken);
};

