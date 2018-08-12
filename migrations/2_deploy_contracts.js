var Ownable = artifacts.require("./Ownable");
var MetaCoin = artifacts.require("./UpdateToken");
var Proxy = artifacts.require("./Proxy");
var Pause = artifacts.require("./Pausable");
var SafeMath = artifacts.require("./SafeMath");
var ERC20Basic = artifacts.require("./ERC20Basic");

module.exports = function(deployer) {
  //deployer.deploy(ERC20Basic);
  deployer.deploy(SafeMath);
  deployer.deploy(Ownable);
  deployer.deploy(Pause);
  deployer.link(Ownable, MetaCoin);
  deployer.deploy(MetaCoin);
  deployer.deploy(Proxy);
};
