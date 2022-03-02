// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Token {
    string public name = "Tak Token";
    string public symbol = "TK";
    uint256 public decimals = 18;
    uint256 public totalSupply;

    //  Track Balance
    mapping(address => uint256) public balanceOf;

    // Event
    event Transfer(address indexed from, address indexed to, uint256 value);

  constructor() {
        totalSupply = 1000000 * (10**decimals);
        balanceOf[msg.sender] = totalSupply;
    }
    // Send Tokens
    function transfer(address _to, uint256 _value) public payable  returns (bool success) {
       require(balanceOf[msg.sender] >= _value);
       require(_to != address(0));
       balanceOf[msg.sender] -=  _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender , _to , _value); 
        return true;
    } 

  
}
