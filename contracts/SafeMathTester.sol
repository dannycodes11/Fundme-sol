// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// Import SafeMath library from OpenZeppelin
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/math/SafeMath.sol";

contract SafeMathTester {
    // using SafeMath for uint8; // attach SafeMath to uint8 type

    uint8 public bigNumber = 255;

    // // Function to test overflow without SafeMath
    // function addWithoutSafeMath() public {
    //     bigNumber = bigNumber + 1; 
    //     // In Solidity 0.6.0, this will overflow and wrap back to 0
    // }

    // // Function to test overflow with SafeMath
    // function addWithSafeMath() public {
    //     bigNumber = bigNumber.add(1); 
    //     // This will revert instead of overflowing
    // }
}
