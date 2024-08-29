

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./Parent.sol";

contract child is Parent {

    function setMessage(string memory _message) public override {
        super.setMessage(_message);

        message = string(abi.encodePacked(message," - Modified by child"));

    }



}