
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Parent {
    string public message;

    function setMessage(string memory _message) virtual public {
        message = _message;        
    }
}