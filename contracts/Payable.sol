// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


contract Payable {
    address payable addr;
    address addr2;

    function  pay() public payable {
        addr.transfer(msg.value/2);
        payable(addr2).transfer(msg.value/2);
    }
}