var UpdateToken = artifacts.require("./UpdateToken");
//var TestUpdateToken = artifacts.require("./TestUpdateToken");
var ProxyContract = artifacts.require("./Proxy");
var OwnableContract = artifacts.require("./Ownable");
var SafeMathContract = artifacts.require("./SafeMath");

module.exports = function(deployer) {
  //deployer.deploy(ConvertLib);
  // deployer.deploy(UpdateToken).then(
  //   DeployedContract => {
  //     deployer.deploy(OwnableContract,DeployedContract.address);
  //   }
  // )
   deployer.deploy(ProxyContract)
   deployer.deploy(UpdateToken);
   //deployer.deploy(TestUpdateToken)
   deployer.deploy(OwnableContract)
   deployer.deploy(SafeMathContract)

  
  //deployer.link(ConvertLib, UpdateToken);
};

