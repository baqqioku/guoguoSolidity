// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Immutable {
    //不可变
    address public immutable MY_ADDRESS;
    uint256 public immutable MY_UINT;

    uint256 public immutable GUOGUO=234;

    constructor(uint256 myUint){
        MY_ADDRESS = msg.sender;
        MY_UINT = myUint;
        //后面不能修改
    }
}