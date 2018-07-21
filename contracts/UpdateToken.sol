pragma solidity ^0.4.24;

import "./Ownable.sol";
//import "./Info.sol";
import "./SafeMath.sol";
import "./StorageState.sol";


    /// Name:       Update token
    /// Symbol:     UPT
    /// Website:    www.updatetoken.org
    /// Telegram:   https://t.me/updatetoken
    /// Twitter:    https://twitter.com/token_update
    /// Gitgub:     https://github.com/UpdateTokens

    contract UpdateToken is StorageState, Ownable {
    using SafeMath for uint256;

    string public name;                   //fancy name: eg Simon Bucks
    uint8 public decimals;                //How many decimals to show.
    string public symbol;                 //An identifier: eg SBX

    function UpdateToken(KeyValueStorage _storage) {
    // set some immutable state

    name = "Update Token";
    symbol = "UPT30";
    //name = "UpdateToken";
    //symbol = UPT26;
    decimals = 18;

    // set token owner in the key-value store
    _storage.setAddress("owner", msg.sender);

        //mint(msg.sender, convertDecimal(100000000));
      //totalSupply() = 
        // maxTotalSupply = convertDecimal(150000000);
        
        // totalInitialSupply = convertDecimal(100000000);
        // chainStartTime = now;
        // chainStartBlockNumber = block.number;
        // balances[founder] = totalInitialSupply;
        // totalSupply = totalInitialSupply;
        //Transfer(address(0), founder, totalInitialSupply); 

    }

    //Modifiers
    modifier canMint() {
      require(!_storage.getBool("mintingFinished"));
      _; 
    }

    function transfer(address to, uint256 value) public returns (bool) {
      require(to != address(0));
      require(value <= getBalance(msg.sender));

      subBalance(msg.sender, value);
      addBalance(to, value);
      return true;
    }

    function mint(address to, uint256 amount) onlyOwner canMint public returns (bool) {
      addSupply(amount);
      addBalance(to, amount);
      return true;
    }

    //Burn from other address
    function burn(address from, uint256 amount) onlyOwner public returns (bool){
      subSupply(amount); //Denk niet dat dit werkt
      subBalance(from, amount);
      return true;
    }
    //Burn from own address
    function burnOwn(address from, uint256 amount) onlyOwner public returns (bool){
      subSupply(amount);
      subBalance(from, amount);
      return true;
    }

    function finishMinting() onlyOwner canMint public returns (bool) {
      _storage.setBool("mintingFinished", true);
      return true;
    }

    function convertDecimal(uint _value) public returns (uint){
        return _value * 1000000000000000000; }
    
    function convertDecimalBack(uint _value) public returns (uint){
        return _value / 1000000000000000000; }

   // Storage
    // ------------------------------------------
    //Get from StorageState 
    
    function getBalance(address balanceHolder) public view returns (uint256) {
    return _storage.getUint(keccak256("balances", balanceHolder)); }
    
    function getChainStartTime() view public returns (uint) {
    return _storage.getChainStartTime("total"); }
    
    function getMaxTotalSupply() view public returns (uint) {
    return _storage.getMaxTotalSupply("total"); }
    
    function getTotalSupply() view public  returns (uint) {
    return _storage.getTotalSupply("total"); }
    
    function getTotalInitialSupply() view public  returns (uint) {
    return _storage.getTotalInitialSupply("total"); }
    
    //  ------------------------------------------
    //Set from StorageState
    
    function setBalance(address balanceHolder, uint256 amount) internal {
    _storage.setUint(keccak256("balances", balanceHolder), amount);
    }

    function setChainStartTime(uint256 num) public {
    _storage.setChainStartTime("total", num);
    }

    function setMaxTotalSupply(uint256 num) public {
    _storage.setMaxTotalSupply("total", num);
    }
    
    function setTotalInitialSupply(uint256 num) public {
    _storage.setTotalInitialSupply("total", num);
    }
    
    function setTotalSupply(uint256 num) public {
    _storage.setTotalSupply("total", num);
    }
  // Get the token balance for account `tokenOwner`
    function balanceOf(address owner) public view returns (uint256 balance) {
    return getBalance(owner);
  }

  // Balances for each account
  function totalSupply() public view returns (uint256) {
    return _storage.getUint("totalSupply");
  }

  //Mint
  function addSupply(uint256 amount) internal {
    _storage.setUint("totalSupply", totalSupply().add(amount));
  }

  //Burn
  function subSupply(uint256 amount) internal {
    _storage.setUint("totalSupply", totalSupply().sub(amount));
  }

  function addBalance(address balanceHolder, uint256 amount) internal {
    setBalance(balanceHolder, getBalance(balanceHolder).add(amount));
  }

  function subBalance(address balanceHolder, uint256 amount) internal {
    setBalance(balanceHolder, getBalance(balanceHolder).sub(amount));
  }


    
    //-----------------------------------------------------------------
    

}


 

 
    
    

    
    

