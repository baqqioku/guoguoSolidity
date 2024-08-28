// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    mapping(address => uint) public balances;

    // Deposit Ether into the contract
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // Withdraw Ether from the contract
    function withdraw(uint wad) public {
        require(balances[msg.sender] >= wad, "Insufficient balance");

        balances[msg.sender] -= wad;
        payable(msg.sender).transfer(wad);
    }
}
