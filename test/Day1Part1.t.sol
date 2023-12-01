// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Day1Part1} from "../src/contracts/Day1Part1.sol";
import {console} from 'forge-std/console.sol';


contract Day1Part1Test is Test {
    Day1Part1 public solve;

    function setUp() public {
        solve = new Day1Part1();
        
    }

   function testSolution() public {
    console.log("Answer: ", solve.solve());
   } 
}
