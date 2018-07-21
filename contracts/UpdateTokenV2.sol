pragma solidity ^0.4.18;

import "./UpdateToken.sol";
import "./StorageState.sol";
import "./Ownable.sol";
contract UpdateTokenV2 is StorageState {
  

  modifier onlyOwner() {
        require(msg.sender == _storage.getAddress("owner"));
        _;
    }

function setNumberOfOwners(uint num) public   onlyOwner {
   _storage.setUint("total", num);
  
}
function getNumberOfOwners() view public  returns (uint) {
   return _storage.getUint("total");
    
}



}