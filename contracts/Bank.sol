
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Bank {
    address public immutable owner;

    bool public isActive = true;


    event Deposit(address _ads,uint256 amount);

    event Withdraw(uint256 amount);

    receive() external payable { 
        emit Deposit(msg.sender, msg.value);
    }

    constructor() payable {
        owner = msg.sender;
    }

    // 方法
    function withdraw() external {
        require(msg.sender == owner, "Not Owner");
        emit Withdraw(address(this).balance);
        //selfdestruct(payable(owner));
         isActive = false;
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

}