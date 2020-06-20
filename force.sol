pragma solidity ^0.6.3;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

//this is an empty contract with no funtions
//the goal is to make this contract have a balance greater than zero
//to do this we have to forcefully send money to the contract
//for us to achieve this we create another proxy contract with value and use a hidden solidity feature selfdestruct
//selfdestruct allows us to destroy a contract. When called it destroys a contract and automatically sends any value in the contract to the owner of the SC
//I know its starting to make sense now.....🤓🤓
//all we have to do is make the owner of our proxy SC our force SC instance address.

//Deploy on Remix
contract RecieveCashWithForce{
    address payable owner;
    
    constructor() public payable{ //use the Value filed of RemixIDE to send Ether at creation of the contract
    }
    
    //call setOwner with your instance address as input 
    function setOwner(address payable _owner) public{
        owner = _owner;
    }
     
    //before calling this function add value to this contract at deployment
    function destroy() public{  
        selfdestruct(owner);
    }
    
}
