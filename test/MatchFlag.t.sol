// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

import {Test} from "forge-std/Test.sol";

contract MatchFlagTest is Test {
    function test_One() public {
        assertEq(uint256(1), uint256(1));
    }

    function test_Two() public {
        assertEq(uint256(2), uint256(2));
    }

    function test_Three() public {
        assertEq(uint256(3), uint256(3));
    }
}
