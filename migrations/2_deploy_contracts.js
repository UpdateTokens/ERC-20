var UpdateToken = artifacts.require("UpdateToken.sol");
var TestUpdateToken = artifacts.require("TestUpdateToken.sol");
var ProxyContract = artifacts.require("contracts/Proxy.sol");
var OwnableContract = artifacts.require("contracts/Ownable.sol");
var SafeMathContract = artifacts.require("contracts/SafeMath.sol");

module.exports = function(deployer) {
  //deployer.deploy(ConvertLib);
  deployer.deploy(ProxyContract)
  deployer.deploy(UpdateToken);
  deployer.deploy(TestUpdateToken)
  deployer.deploy(OwnableContract)
  deployer.deploy(SafeMathContract)
  //deployer.link(ConvertLib, UpdateToken);
};

