// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Token {
    string public name = "Tak Token";
    string public symbol = "TK";
    uint256 public decimals = 18;
    uint256 public totalSupply;

    //  Track Balance
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allownce;
    // Event
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    constructor() {
        totalSupply = 1000000 * (10**decimals);
        balanceOf[msg.sender] = totalSupply;
    }

    // Send Tokens
    function transfer(address _to, uint256 _value)
        public
        payable
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value);
        _transfer(msg.sender, _to, _value);
        return true;
    }

    function _transfer(
        address _from,
        address _to,
        uint256 _value
    ) internal {
        require(_to != address(0));
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
    }

    //Approve Token
    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        require(_spender != address(0));
        allownce[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Transfer Token
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allownce[_from][msg.sender]);
        allownce[_from][msg.sender] -=  _value;
        _transfer(_from, _to, _value);
        return true;
    }
}
