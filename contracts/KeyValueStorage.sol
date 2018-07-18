pragma solidity ^0.4.18;

contract KeyValueStorage {

    mapping(address => mapping(bytes32 => uint256)) _uintStorage;
    mapping(address => mapping(bytes32 => address)) _addressStorage;
    mapping(address => mapping(bytes32 => bool)) _boolStorage;
    mapping (address => mapping (address => mapping(address => uint256)))  _allowanceStorage;
    //new ------------------------------------------------------------------------  
    mapping(address => mapping(bytes32 => uint256)) _balances; //done
    mapping(address => mapping (bytes32 => uint256)) _allowed; //done
    mapping(address => mapping(bytes32 => bool)) _frozenAccount; //done
    mapping(address => mapping(bytes32 => uint256)) _stakeStartTime; //done
    mapping(address => mapping(bytes32 => uint256)) _stakeMinAge; //done
    mapping(address => mapping(bytes32 => uint256)) _stakeMaxAge; //done
    mapping(address => mapping(bytes32 => uint256)) _symbol; //done
    mapping(address => mapping(bytes32 => string)) _name; //done
    mapping(address => mapping(bytes32 => uint)) _decimals; //done
    mapping(address => mapping(bytes32 => uint)) _totalSupply; //done
    mapping(address => mapping(bytes32 => uint)) _maxTotalSupply; //done
    mapping(address => mapping(bytes32 => uint)) _totalInitialSupply; //done
    mapping(address => mapping(bytes32 => uint)) _chainStartTime; // done
    mapping(address => mapping(bytes32 => uint)) _chainStartBlockNumber; //done
    mapping(address => mapping(bytes32 => uint)) _stakeSTartTime; //done
    mapping(address => mapping(bytes32 => uint)) _maxMintProofOfStake; //done
    mapping(address => mapping(bytes32 => uint256)) _feeVUP; //done
    mapping(address => mapping(bytes32 => string)) _urlVUP; //done
    mapping(address => mapping(bytes32 => address)) _addressVUP; //done
    mapping(address => mapping(bytes32 => uint256)) _nodeAmmount; //done
    mapping(address => mapping(bytes32 => uint256)) _nodeIntrest; //done
    mapping(address => mapping(bytes32 => uint128)) _ammount; //done
    mapping(address => mapping(bytes32 => uint64)) _time;
    mapping(address => mapping(bytes32 => address)) _founder;
    //Reserve
    mapping(address => mapping(bytes32 => string)) _updateTokenString;
    mapping(address => mapping(bytes32 => uint256)) _updateTokenUint256;
    mapping(address => mapping(bytes32 => uint)) _updateTokenUint;
    mapping(address => mapping(bytes32 => bool)) _updateTokenBool;
    mapping(address => mapping(bytes32 => address)) _updateTokenAddress;
    mapping(address => mapping(bytes32 => uint64)) _updateTokenUint64;
    



  /**** Get Methods ***********/


       function getTime(bytes32 key) public view returns (uint64) {
     _time[msg.sender][key];
  }

       function getAmmount(bytes32 key) public view returns (uint128) {
     _ammount[msg.sender][key];
  }

       function getNodeIntrest(bytes32 key) public view returns (uint256) {
     _nodeIntrest[msg.sender][key];
  }

       function getAddressVUP(bytes32 key) public view returns (address) {
     _addressVUP[msg.sender][key];
  }

       function getNodeAmmount(bytes32 key) public view returns (uint256) {
     _nodeAmmount[msg.sender][key];
  }
  
       function getAddressVUP(bytes32 key) public view returns (address) {
     _addressVUP[msg.sender][key];
  }

       function getFeeVUP(bytes32 key) public view returns (string) {
     _urlVUP[msg.sender][key];
  }

       function getFeeVUP(bytes32 key) public view returns (uint256) {
     _feeVUP[msg.sender][key];
  }

     function getName(bytes32 key) public view returns (string) {
     _name[msg.sender][key];
  }

     function getSymbol(bytes32 key) public view returns (uint256) {
     _symbol[msg.sender][key];
  }

  function getMaxMintProofOfStake(bytes32 key) public view returns (uint) {
      _maxMintProofOfStake[msg.sender][key];
  }

  function getStakeSTartTime(bytes32 key) public view returns (uint) {
      _stakeSTartTime[msg.sender][key];
  }

  function getChainStartBlockNumber(bytes32 key) public view returns (uint) {
      _chainStartBlockNumber[msg.sender][key];
  }
  

     function getStakeMaxAge(bytes32 key) public view returns (uint256) {
     _stakeMaxAge[msg.sender][key];
  }

     function getStakeMinAge(bytes32 key) public view returns (uint256) {
      _stakeMinAge[msg.sender][key];
  }

     function getStakeStartTime(bytes32 key) public view returns (uint256) {
      _stakeStartTime[msg.sender][key];
  }
     function getFrozenAccount(bytes32 key) public view returns (bool) {
      _frozenAccount[msg.sender][key];
  }
      function getAllowed(bytes32 key) public view returns (uint256) {
      _allowed[msg.sender][key];
  }
  
    function getBalance(bytes32 key) public view returns (uint256) {
      _balances[msg.sender][key];
  }
  
  function getChainStartTime(bytes32 key) public view returns (uint) {
      _chainStartTime[msg.sender][key];
  }
  
  function getMaxTotalSupply(bytes32 key) public view returns (uint) {
      _maxTotalSupply[msg.sender][key];
  }
  
  function getTotalInitialSupply(bytes32 key) public view returns (uint) {
      return _totalInitialSupply[msg.sender][key];
  }

  function getTotalSupply(bytes32 key) public view returns (uint) {
      return _totalSupply[msg.sender][key];
  }

  function getAddress(bytes32 key) public view returns (address) {
      return _addressStorage[msg.sender][key];
  }

  function getUint(bytes32 key) public view returns (uint) {
      return _uintStorage[msg.sender][key];
  }

  function getBool(bytes32 key) public view returns (bool) {
      return _boolStorage[msg.sender][key];
  }
  
  function  getAllowance(address owner,address spender) public view returns (uint) {
    return _allowanceStorage[msg.sender][owner][spender];
  }
  
  /**** Set Methods ***********/
  

        function setTime(bytes32 key, uint64 value) public {
      _time[msg.sender][key] = value;
  }

        function setNodeIntrest(bytes32 key, uint128 value) public {
      _ammount[msg.sender][key] = value;
  }

        function setNodeIntrest(bytes32 key, uint256 value) public {
      _nodeIntrest[msg.sender][key] = value;
  }

        function setNodeAmmount(bytes32 key, uint256 value) public {
      _nodeAmmount[msg.sender][key] = value;
  }

      function setAddressVUP(bytes32 key, address value) public {
      _addressVUP[msg.sender][key] = value;
  }

      function setUrlVUP(bytes32 key, string value) public {
      _urlVUP[msg.sender][key] = value;
  }

      function setFeeVUP(bytes32 key, uint256 value) public {
      _feeVUP[msg.sender][key] = value;
  }

    function setSymbol(bytes32 key, string value) public {
      _name[msg.sender][key] = value;
  }

    function setSymbol(bytes32 key, uint256 value) public {
      _symbol[msg.sender][key] = value;
  }

  function setMaxMintProofOfStake(bytes32 key, uint value) public {
      _maxMintProofOfStake[msg.sender][key] = value;
  }


  function setStakeSTartTime(bytes32 key, uint value) public {
      _stakeSTartTime[msg.sender][key] = value;
  }

  function setChainStartBlockNumber(bytes32 key, uint value) public {
      _chainStartBlockNumber[msg.sender][key] = value;
  }

  function setStakeMaxAge(bytes32 key, uint256 value) public {
      _stakeMaxAge[msg.sender][key] = value;
  }

  function setStakeMinAge(bytes32 key, uint256 value) public {
      _stakeMinAge[msg.sender][key] = value;
  }

  function setStakeStartTime(bytes32 key, uint256 value) public {
      _stakeStartTime[msg.sender][key] = value;
  }

  function setFrozenAccount(bytes32 key, bool value) public {
      _frozenAccount[msg.sender][key] = value;
  }

  function setAllowed(bytes32 key, uint256 value) public {
      _allowed[msg.sender][key] = value;
  }
  
  function setBalance(bytes32 key, uint256 value) public {
      _balances[msg.sender][key] = value;
  }
  
  function setChainStartTime(bytes32 key, uint value) public {
      _chainStartTime[msg.sender][key] = value;
  }
  
  function setMaxTotalSupply(bytes32 key, uint value) public {
      _maxTotalSupply[msg.sender][key] = value;
  }
  
  function setTotalInitialSupply(bytes32 key, uint value) public {
      _totalInitialSupply[msg.sender][key] = value;
  }
  
  function setTotalSupply(bytes32 key, uint value) public {
      _totalSupply[msg.sender][key] = value;
  }

  function setAddress(bytes32 key, address value) public {
    _addressStorage[msg.sender][key] = value;
  }

  function setUint(bytes32 key, uint value) public {
      _uintStorage[msg.sender][key] = value;
  }

  function setBool(bytes32 key, bool value) public {
      _boolStorage[msg.sender][key] = value;
  }
  function setAllowance(address owner,address spender,uint value) public {
            _allowanceStorage[msg.sender][owner][spender] = value;
  }
  
  /**** Delete Methods ***********/
 

     function deleteTime(bytes32 key) public {
      delete  _time[msg.sender][key];
  }

     function deleteAmmount(bytes32 key) public {
      delete _ammount[msg.sender][key];
  }

     function deleteNodeAmmount(bytes32 key) public {
      delete _nodeIntrest[msg.sender][key];
  }

     function deleteNodeAmmount(bytes32 key) public {
      delete _nodeAmmount[msg.sender][key];
  }

     function deleteAddressVUP(bytes32 key) public {
      delete _addressVUP[msg.sender][key];
  }

     function deleteUrlVUP(bytes32 key) public {
      delete _urlVUP[msg.sender][key];
  }

   function deleteFeeVUP(bytes32 key) public {
      delete _feeVUP[msg.sender][key];
  }

 function deleteSymbol(bytes32 key) public {
      delete _name[msg.sender][key];
  }

 function deleteSymbol(bytes32 key) public {
      delete _symbol[msg.sender][key];
  }

 function deleteMaxMintProofOfStake(bytes32 key) public {
      delete _maxMintProofOfStake[msg.sender][key];
  }

 function deleteStakeSTartTime(bytes32 key) public {
      delete _stakeSTartTime[msg.sender][key];
  }

 function deleteChainStartBlockNumber(bytes32 key) public {
      delete _chainStartBlockNumber[msg.sender][key];
  }

 function deleteStakeMaxAge(bytes32 key) public {
      delete _stakeMaxAge[msg.sender][key];
  }

 function deleteStakeMinAge(bytes32 key) public {
      delete _stakeMinAge[msg.sender][key];
  }

  function deleteStakeStartTime(bytes32 key) public {
      delete _stakeStartTime[msg.sender][key];
  }
  
  function deleteFrozenAccount(bytes32 key) public {
      delete _frozenAccount[msg.sender][key];
  }

  function deleteAllowed(bytes32 key) public {
      delete _allowed[msg.sender][key];
  }

  function deleteBalance(bytes32 key) public {
      delete _balances[msg.sender][key];
  }
  
  function deleteChainStartTime(bytes32 key) public {
      delete _chainStartTime[msg.sender][key];
  }
  
  function deleteMaxTotalSupply(bytes32 key) public {
      delete _maxTotalSupply[msg.sender][key];
  }
  
  function deleteTotalInitialSupply(bytes32 key) public {
      delete _totalInitialSupply[msg.sender][key];
  }
  
  function deleteTotalSupply(bytes32 key) public {
      delete _totalSupply[msg.sender][key];
  }

  function deleteAddress(bytes32 key) public {
      delete _addressStorage[msg.sender][key];
  }

  function deleteUint(bytes32 key) public {
      delete _uintStorage[msg.sender][key];
  }

  function deleteBool(bytes32 key) public {
      delete _boolStorage[msg.sender][key];
  }

}
