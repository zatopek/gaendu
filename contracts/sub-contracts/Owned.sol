pragma solidity ^0.4.8;

contract Owned {
    address owner;
    uint numberOfCoOwners;
	
    function getOwner() public constant returns (address addr) {
        return owner;
    }
    
    struct CoOwner {
		address addr;
		uint allowance;
		bool isValue;
	}

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }
}