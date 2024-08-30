// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TargetContract {
    event Received(string message);

    function doSomething() external {
        emit Received("TargetContract: doSomething() was called successfully!");
    }

    function willFail() pure external {
        require(false, "TargetContract: This function always fails");
    }
}
