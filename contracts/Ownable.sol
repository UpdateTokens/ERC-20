pragma solidity ^0.4.2;

import "./UpdateToken.sol";
import "./SafeMath.sol";

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