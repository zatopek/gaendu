pragma solidity ^0.4.8;

import "../installed_contracts/tokens/contracts/HumanStandardToken.sol";
import  "./sub-contracts/Owned.sol";

contract Gaendu is HumanStandardToken, Owned {

    function Gaendu (
        uint256 _initialAmount,
        uint256 _totalSupply,
        string _name,
        string _symbol
        ) public {
        owner = msg.sender;
        balances[msg.sender] = _initialAmount;
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
    }
}
