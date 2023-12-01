//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {console} from "forge-std/console.sol";
import {CommonBase} from "forge-std/Base.sol";

//import 'forge-std/Vm.sol';

contract Solve is CommonBase {
    function solve() public returns(uint256 resultNum) {
        string memory data = vm.readFile("./input.txt");
        assembly {
            function readBytes(sequence, index) -> result {
                let rowIndex := div(index, 0x20)
                let colIndex := mod(index, 0x20)
                let slotIndex := add(sequence, add(0x20, mul(rowIndex, 0x20)))
                let slotValue := mload(slotIndex)
        
             
                let leftShifts := mul(colIndex, 8)
                let rightShifts := mul(0x1f, 8)
            
                result := shl(leftShifts, slotValue)
                result := shr(rightShifts, result)
            }

            let length := mload(data)

            let firstNum := 0
            let lastNum := 0

            for {
                let i := 0
            } lt(i, length) {
                i := add(i, 0x1)
            } {
                
                let char := readBytes(data, i)
               
               
                // if the char is digit...
               if and(gt(char, 0x30), lt(char, 0x40)) {
                  // ...convert it to number
                  lastNum := sub(char, 0x30)

                  if iszero(firstNum) {
                    firstNum := lastNum
                  }
               }

                // if the char is a new line
                 if eq(char, 0x0d) {
                    let currentResult := add(mul(firstNum, 10), lastNum)
                    resultNum := add(resultNum, currentResult)

                    firstNum := 0
                    lastNum := 0
                    continue
                }

               
            }

            
            if not(iszero(firstNum)) {
                let currentResult := add(mul(firstNum, 10), lastNum)
                resultNum := add(resultNum, currentResult)
            }
        }
    }
}
