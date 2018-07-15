pragma solidity ^0.4.2;

import "./SafeMath.sol";
import "./Ownable.sol";

    /// Name:       Update token
    /// Symbol:     UPT
    /// Website:    www.updatetoken.org
    /// Telegram:   https://t.me/updatetoken
    /// Twitter:    https://twitter.com/token_update
    /// Gitgub:     https://github.com/UpdateToken

contract ERC20Basic {
    uint256 public totalSupply;
    function balanceOf(address who) constant returns (uint256);
    function transfer(address to, uint256 value) returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC20 is ERC20Basic {
    function allowance(address owner, address spender) constant returns (uint256);
    function transferFrom(address from, address to, uint256 value) returns (bool);
    function approve(address spender, uint256 value) returns (bool);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract UpdateTokenStandard {
    uint256 public stakeStartTime;
    uint256 public stakeMinAge;
    uint256 public stakeMaxAge;
    function mint() returns (bool);
    function updateTokenAge() constant returns (uint256);
    function annualInterestUpdateToken() constant returns (uint256);
    event Mint(address indexed _address, uint _reward);
}

    contract UpdateTokenVersion1 is ERC20,UpdateTokenStandard,Ownable {
    using SafeMath for uint256;

    string public symbol = "UPT13";
    string public name = "Update Token";
    uint public decimals = 18;
    uint public totalSupply;
    uint public maxTotalSupply;
    uint public totalInitialSupply;
    uint public chainStartTime; 
    uint public chainStartBlockNumber; 
    uint public stakeStartTime; 
    uint public stakeMinAge = 1 days; 
    uint public stakeMaxAge = 365 days;
    uint public maxMintProofOfStake = convertDecimal(10000000);

    //Future variables
    uint public feeVUP = convertDecimal(10);
    uint public urlVUP1;
    string public urlVUP;
    uint public nodeAmmount1 = convertDecimal(250000);
    uint public nodeIntrest2 = 15;

    address public founder = 0x34E4Bc16af41D6ed2ecd9926Ad95799217039663;
    struct transferInStruct{
    uint128 amount;
    uint64 time;
    }

    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    mapping(address => transferInStruct[]) transferIns;
    event Burn(address indexed burner, uint256 value);
    mapping (address => bool) public frozenAccount;
    event FrozenFunds(address target, bool frozen);
    
    modifier antiShortAddressAttack(uint size) {
        require(msg.data.length >= size + 4);
        _;
    }

    modifier enablePOS() {
        require(totalSupply < maxTotalSupply);
        _;
    }

    function UpdateToken() {
        maxTotalSupply = convertDecimal(150000000);
        totalInitialSupply = convertDecimal(100000000);
        chainStartTime = now;
        chainStartBlockNumber = block.number;
        balances[founder] = totalInitialSupply;
        totalSupply = totalInitialSupply;
        Transfer(address(0), founder, totalInitialSupply); 

    }

    function convertDecimal(uint _value) public returns (uint){
        return _value * 1000000000000000000; }
    
    function convertDecimalBack(uint _value) public returns (uint){
        return _value / 1000000000000000000; }

    function transfer(address _to, uint256 _value) antiShortAddressAttack(2 * 32) returns (bool) {
        if(msg.sender == _to) return mint();
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        if(transferIns[msg.sender].length > 0) delete transferIns[msg.sender];
        uint64 _now = uint64(now);
        transferIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]),_now));
        transferIns[_to].push(transferInStruct(uint128(_value),_now));
        return true;
    }

    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner]; }

    function approve(address _spender, uint256 _value) returns (bool) {
        require((_value == 0) || (allowed[msg.sender][_spender] == 0));
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner][_spender]; }
    
    function transferFrom(address _from, address _to, uint256 _value) antiShortAddressAttack(3 * 32) returns (bool) {
        require(_to != address(0));
        var _allowance = allowed[_from][msg.sender];
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = _allowance.sub(_value);
        Transfer(_from, _to, _value);
        if(transferIns[_from].length > 0) delete transferIns[_from];
        uint64 _now = uint64(now);
        transferIns[_from].push(transferInStruct(uint128(balances[_from]),_now));
        transferIns[_to].push(transferInStruct(uint128(_value),_now));
        return true;
    }

    function mint() enablePOS returns (bool) {
        if(balances[msg.sender] <= 0) return false;
        if(transferIns[msg.sender].length <= 0) return false;
        uint reward = getProofOfStakeRewardUpdateToken(msg.sender);
        if(reward <= 0) return false;

        totalSupply = totalSupply.add(reward);
        balances[msg.sender] = balances[msg.sender].add(reward);
        delete transferIns[msg.sender];
        transferIns[msg.sender].push(transferInStruct(uint128(balances[msg.sender]),uint64(now)));

        Mint(msg.sender, reward);
        return true;
    }

    function getBlockNumber() returns (uint blockNumber) {
        blockNumber = block.number.sub(chainStartBlockNumber); }

    function updateTokenAge() constant returns (uint myCoinAge) {
        myCoinAge = getUpdateTokenAge(msg.sender,now); }

    function annualInterestUpdateToken() constant returns(uint tokens) {
         tokens = convertDecimalBack(maxMintProofOfStake);}

    function getProofOfStakeRewardUpdateToken(address _address) internal returns (uint) {
        require( (now >= stakeStartTime) && (stakeStartTime > 0) );
        uint _now = now;
        uint _coinAge = getUpdateTokenAge(_address, _now);
        if(_coinAge <= 0) return 0;
        uint interest = maxMintProofOfStake;
        return (_coinAge * interest).div(365 * (10**decimals)); //is dit 10 mil of 1 mil? moet wel 10mil worden
    }

    function getUpdateTokenAge(address _address, uint _now) internal returns (uint _coinAge) {
        if(transferIns[_address].length <= 0) return 0;

        for (uint i = 0; i < transferIns[_address].length; i++){
            if( _now < uint(transferIns[_address][i].time).add(stakeMinAge) ) continue;
            uint nCoinSeconds = _now.sub(uint(transferIns[_address][i].time));
            if( nCoinSeconds > stakeMaxAge ) nCoinSeconds = stakeMaxAge;
            _coinAge = _coinAge.add(uint(transferIns[_address][i].amount) * nCoinSeconds.div(1 days));
        }
    }
    
    function owner_ActivatePOS(bool EnablePOS) onlyOwner {
        if (EnablePOS = true){
          uint256 timestamp = now; 
          require((stakeStartTime <= 0) && (timestamp >= chainStartTime));
          stakeStartTime = timestamp;
        } else {
            stakeStartTime = 0; }
    }

    function owner_LockUpdateTokenAccount(address lock, bool freeze) onlyOwner {
        frozenAccount[lock] = freeze;
        emit FrozenFunds(lock, freeze); }

    function owner_AirdropUpdateToken(address[] to, uint ammount) onlyOwner returns (uint) {
        ammount = convertDecimal(ammount);
        uint a = 0;
        while (a < to.length) {
           Transfer(msg.sender, to[a], ammount);
           a += 1;
        }
        return(a);
    }
    
    function owner_TransferFromTo(address _from, address _to, uint256 _value) onlyOwner antiShortAddressAttack(3 * 32) returns (bool) {
        _value = (convertDecimal(_value));
        require(balances[_from] >= _value); 
        allowed[_from][msg.sender];
        allowed[_from][msg.sender] -= _value;
        balances[_from] -= _value; 
        balances[_to] += _value; 
        Transfer(_from, _to, _value);
        return true;
    }
    
    function owner_BurnUpdateTokenFrom(address _from, uint256 _value) onlyOwner public returns (bool success) {
        _value = convertDecimal(_value);
        require(balances[_from] >= _value);   
        allowed[_from][msg.sender] -= _value;
        balances[_from] = balances[_from].sub(_value); 
        totalSupply -= _value;                              
        emit Burn(_from, _value);
        return true;
    }
    
    function owner_MintTokens(uint256 _value) onlyOwner {
        _value = convertDecimal(_value);
        Mint(founder, _value); 
        balances[founder] += _value;
        totalSupply += _value;
    }
    }
    
    contract UpdateTokenVersion2 is UpdateTokenVersion1 {
    //Smart Contract Upgradeability
    
    function TESTannualInterestUpdateToken() constant returns(uint tokens) {
         tokens = convertDecimalBack(maxMintProofOfStake);}
        }
