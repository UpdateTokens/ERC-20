pragma solidity ^0.4.24;

 //import "./UpdateToken.sol";

contract Ownable {
    
    address public owner;

    function Ownable() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwnershipUpdateToken(address newAddress) onlyOwner {
        require(newAddress != address(0));
        owner = newAddress;
    }
}

