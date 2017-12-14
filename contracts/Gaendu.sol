pragma solidity ^0.4.8;

import "../installed_contracts/tokens/contracts/HumanStandardToken.sol";
import "./sub-contracts/Owned.sol";
import "./sub-contracts/HashMined.sol";

contract Gaendu is HumanStandardToken, Owned, HashMined {

    function Gaendu(
        uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol
        ) {
        //Should we hardcode this? We should not need to accept this.
        owned();
        lastTimeOfProof = now;
        balances[owner] = _initialAmount;               // Give the creator all initial tokens
        totalSupply = _initialAmount;                        // Update total supply
        name = _tokenName;                                   // Set the name for display purposes
        decimals = _decimalUnits;                            // Amount of decimals for display purposes
        symbol = _tokenSymbol;                               // Set the symbol for display purposes
    }

    /*
    Create new tokens if needed. Can only be done by the owner
    */
    function mintToken(address target, uint256 amount) onlyOwner {
        balanceOf[target] += amount;
        totalSupply += amount;
        Transfer(0, owner, amount);
        Transfer(owner, target, amount);
    }
}
