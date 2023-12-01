// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Solve} from "../src/contracts/Solve.sol";
import {console} from 'forge-std/console.sol';


contract SolveTest is Test {
    Solve public solve;

    function setUp() public {
        solve = new Solve();
        console.log("Answer: ", solve.solve());
    }

   function testReading() public {
    solve.solve();
   } 
}
