// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

import {Test} from "forge-std/Test.sol";
import {Vault} from "../src/Vault.sol";

contract VaultTest is Test {
    Vault vault;
    address user;

    function setUp() public {
        vault = new Vault();

        user = makeAddr("user");

        deal(user, 10 ether);
    }
    function test_Deposit() public {
        // Arrange
        uint256 depositAmount = 1 ether;

        vm.startPrank(user);

        vault.deposit{value: depositAmount}();

        assertEq(vault.getBalance(), depositAmount);

        vm.stopPrank();
    }
    function test_Withdraw() public {
        // Arrange
        uint256 depositAmount = 1 ether;

        vm.startPrank(user);
        vault.deposit{value: depositAmount}();

        uint256 balanceBeforeWithdraw = user.balance;

        // Act
        vault.withdraw();

        // Assert
        assertEq(vault.getBalance(), 0);
        assertEq(user.balance, balanceBeforeWithdraw + depositAmount);

        vm.stopPrank();
    }
    function test_WithdrawRevert() public {
        // Arrange
        vm.prank(user);

        // Assert + Act
        vm.expectRevert("No balance to withdraw");
        vault.withdraw();
    }
}
