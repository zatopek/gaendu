pragma solidity ^0.4.8;

contract Owned {
    address owner;
    
    struct CoOwner {
        address addr;
        uint allowance;
        bool isValue;
    }

    uint numberOfCoOwners;
    mapping(address => CoOwner) coOwners;

    function owned() public {
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

    function addOwner(address coowner, uint allowance) public onlyOwner {
        require(coOwners[coowner].isValue == true);

        coOwners[coowner] = CoOwner({ addr: coowner, allowance: allowance, isValue : false});
        coOwners[coowner].isValue = true;
    }

}