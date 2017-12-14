pragma solidity ^0.4.8;

contract Owned {
    address owner;
    
    struct CoOwner {
        address addr;
        unit allowance;
    }

    uint numberOfCoOwners;
    mapping(address => CoOwner) coOwners;

    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    modifier onlyCoOwner {
        require(coOwners[msg.sender].isValue);
        _;
    }

    function addOwner(address coowner, uint allowance) onlyOwner {
        if(coOwners[coowner].isValue) throw;

        coOwners[coowner] = CoOwner{ addr: coowner, allowance: allowance};
        coOwners[coowner].isValue = true;
    }

}