

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TestStorage {
    uint256 public val;
    function test() public returns (bool, bytes memory){
        val =123;
        bytes memory c = "223";
        address payable   b = payable(0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c);
        //b.transfer(value);
        //(bool success, bytes memory data) = b.call{value: msg.value}("");
        (bool success, bytes memory data) = b.call(c);
    
        return (success,data);
    }
}