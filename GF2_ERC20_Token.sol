pragma solidity ^0.6.0 ;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/math/SafeMath.sol";
import "ERC20_Token.sol";

contract GF2_Token is ERC20{ 
        constructor(uint256 total) public { 
            _totalSupply = total; 
            balances[msg.sender] = _totalSupply; 
            name = "GeekForFreeToken";
            symbol = "GF2";
            decimals = 18;
        }
    }