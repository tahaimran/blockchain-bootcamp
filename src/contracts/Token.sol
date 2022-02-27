// SPDX-License-Identifier: MIT
pragma solidity  ^0.5.16;

contract Token {
  
    string public name = "Tak Token";
    string public symbol = "TK";
    uint256 public decimals = 18;
    uint256 public totalSupply;

        constructor() public  {
             totalSupply = 1000000 * (10 ** decimals);
        }
}
