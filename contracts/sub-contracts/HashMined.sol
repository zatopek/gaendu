pragma solidity ^0.4.8;

import "../../installed_contracts/tokens/contracts/HumanStandardToken.sol";

contract HashMined is HumanStandardToken {
    bytes32 public currentChallenge;
    uint public lastTimeOfProof;
    uint public difficulty = 10**32;


    function proofOfWork(uint nonce) public { 
        bytes8 n = bytes8(keccak256(nonce, currentChallenge));
        require(n >= bytes8(difficulty));

        uint timeSinceLastProof = (now - lastTimeOfProof);        
        balances[msg.sender] += timeSinceLastProof/60 seconds;

        difficulty = difficulty * 10 minutes/timeSinceLastProof + 1;
        lastTimeOfProof = now;
        currentChallenge = keccak256(nonce, currentChallenge, block.blockhash(block.number - 1));
    }
}