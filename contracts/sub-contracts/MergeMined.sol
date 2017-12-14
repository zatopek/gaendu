pragma solidity ^0.4.8;

contract MergeMined {
    function giveBlockReward() {
        balanceOf[block.coinbase] += 1;
    }
}