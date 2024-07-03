
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Send {
    function send(address payable addr) public payable {
        addr.transfer(1 ether);
        bool  sendSuccess =  addr.send(1 ether);
        (bool callSuccess, ) = addr.call{value: 1 ether}("");
    }
}