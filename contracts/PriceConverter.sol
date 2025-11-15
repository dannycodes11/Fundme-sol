// SPDX-License-Identifier: MIT
pragma solidity  0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
    function getPrice() internal view returns (uint256) {
        // Addrress 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // Abi
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );

        (, int256 price, , ,) = priceFeed.latestRoundData(); 
        // ETH/USD rate in 8 decimals, so multiply by 1e10 to make it 18 decimals
        return uint256(price * 1e10);
        //uint80 roundId,uint256 startedAt, uint256 timestamp, uint80 answeredInRound
    }

    function getConversionRate(uint256 ethAmount) internal  view returns(uint256){
        // placeholder function for conversion logic
        // 1 ETH?
        // 2000_00000000000000000
        uint256 ethPrice = getPrice();
        // (2000_00000000000000000 * 1_000000000000000000) / 1e18;
        //$2000 = 1ETH  
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function getVersion() internal  view returns (uint256) {
        return AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
            // 0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF
        ).version();
    }
}

// 1. Enum
// 2. Events
// 3. Try / Catch
// 4. Function Selector
// 5. abi.encode / decode
// 6. Hash with keccak256
// 7. Yul / Assembly