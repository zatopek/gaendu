pragma solidity ^0.4.8

contract HashMined {
    bytes32 public currentChallenge;
    uint public lastTimeOfProof;
    uint public difficulty = 10**32;


    function proofOfWork(uint nonce){
        bytes8 n = bytes8(sha3(none, currentChallenge));
        require(n >= bytes(difficulty));

        uint timeSinceLastProof = (now - lastTimeOfProof);        
        balance[msg.sender] += timeSinceLastProof/60 seconds;

        difficulty = difficulty * 10 minutes/timeSinceLastProof + 1;
        lastTimeOfProof = now;
        currentChallenge = sha3(nonce, currentChallenge, block.blockhash(block.number - 1);)
    }
}