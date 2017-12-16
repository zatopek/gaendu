pragma solidity ^0.4.8;

contract Owned {
    address owner;
    uint numberOfCoOwners;
	
    struct CoOwner {
		address addr;
		uint256 allowance;
		bool isValue;
	}

    mapping(address => CoOwner) coowners;

    function getOwner() public constant returns (address addr) {
        return owner;
    }

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function isCoOwner(address coowner) public constant returns (bool result) {
        return coowners[coowner].isValue;
    }

    function addCoOwner(address coowner, uint256 allowance) public returns (bool result) {
        require(coowners[coowner].isValue == false);
        coowners[coowner] = CoOwner({addr: coowner, allowance: allowance, isValue: true}); 
        numberOfCoOwners += 1;
        OwnerAdded(coowner, allowance);       
        return true;
    }

    event OwnerAdded(address indexed _coowner, uint256 _value);

} 