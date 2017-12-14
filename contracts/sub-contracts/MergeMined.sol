pragma solidity ^0.4.8;
import "../../installed_contracts/tokens/contracts/HumanStandardToken.sol";

contract MergeMined is HumanStandardToken{
    function giveBlockReward() {
        balances[block.coinbase] += 1;
    }
}