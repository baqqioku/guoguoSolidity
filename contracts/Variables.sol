// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Variables {
    string public text = "Hello";
    uint256 public num = 123;

    function doSomething() public view returns (uint256,address,uint256){
        uint256 timestamp = block.timestamp; 
        address sender = msg.sender; 
        uint256 ii = 456;
        // 返回这些局部变量以消除未使用变量的警告
        return (timestamp, sender, ii);
    }
}