// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract Vault {

    mapping(address => uint256) private balances;

    // Deposit ETH
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // Get user balance
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // Withdraw ETH
    function withdraw() public {
        uint256 amount = balances[msg.sender];

        require(amount > 0, "No balance to withdraw");

        balances[msg.sender] = 0;

        (bool success, ) = payable(msg.sender).call{value: amount}("");

        require(success, "Transfer failed");
    }
}