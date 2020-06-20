pragma solidity ^0.4.18;

contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  function Token(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}


//Phewww 🤯🤯🤯....This one took me a while :)
//It seems solidity integers are not actually integers
//Note: The difference between two uint, is another uint, that is the difference will always be equal or greater than zero! 
//Thus, the condition balances[msg.sender] - _value >= 0 will always evaluate to true
//Therefore, 20-21 = 2^256 - 1. This is as a result of solidity underflow, which results from unsafely extracting a uint from another
//To avoid this underflows and overflows in solidity use the safemath library from openzeppelin

//In Console
//await contract.transfer("instance-address", 21)
