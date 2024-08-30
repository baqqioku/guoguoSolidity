

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Callee {
    uint public x;
    address public caller;

    function setX(uint _x) public {
        caller = msg.sender;
        x = _x;
    }

}

contract Caller {
    address public caller;
    address calleeAddress;
    constructor(address _calleeAddress){
        calleeAddress = _calleeAddress;
    }

    function setCalleeX(uint _x) public {
        caller = msg.sender;
        Callee callee = Callee(calleeAddress);
        callee.setX(_x);
    }
}

//0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8

//0xd9145CCE52D386f254917e481eB44e9943F39138