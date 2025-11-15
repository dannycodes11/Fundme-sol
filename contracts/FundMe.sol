// Get fund users
//withdraw funds
// set a minimum funding value in usd  
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    // uint256 public myValue = 1;

    uint256 public constant MINIMUM_USD = 5e18;

    address[] public funders;
    mapping(address => uint256) public addressToAMountFunded;

    address public immutable i_owner;

// is a key word and can create without the function keyword
    constructor () {
         i_owner = msg.sender;
    }

    function fund() public payable {
        // ALLOW USER TO SEND $
        // HAVE A minimum $send 
        // 1. how do we send ETH i
        // myValue = myValue + 2;
        // require(getConversionRate(msg.value) >= minimumUsd, "didn't send enough eth");

        // "why is msg.value.getConvertionRate having issue"
         msg.value.getConversionRate();
        require(
            msg.value.getConversionRate() >= MINIMUM_USD,
            "didn't send enough eth"
        );
        funders.push(msg.sender);
        addressToAMountFunded[msg.sender] +=
            // addressToAMountFunded[msg.sender] +
            msg.value;

        // 1e18 = 1 ETH =1000000000000000000 = 1 * 10 ** 18
        //require(msg.value > 50 gwei, "You need to spend more ETH!")
        // a ton of computation 
        
        // what is revert
        // undo any action that have been done, and send the remaining gas back
    }

    // future function to withdraw funds
    // for loop 
    function withdraw() public onlyOwner {
      //  require(msg.sender == owner, "must be owner");
        // for (   /* starting index, ending index, step amount*/)
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
                    address funder = funders[funderIndex];
                    addressToAMountFunded[funder] = 0;
        }

        funders = new address[](0);
        // ways to withdraw the funds 
        // transfer
       
        // call

        // msg.sender = address
        //payable(msg.sender) = payable address
       // payable(msg.sender).transfer(address(this).balance);
         // send
       // bool sendSuccess = payable(msg.sender).send(address(this).balance);
       // require(sendSuccess, "send failed");

        // call using call is the most recomendable way 
        
       (bool callSuccess, /*bytes memory dataReturned*/) = payable (msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed"); 

    }

    modifier onlyOwner(){
        // require(msg.sender == i_owner, "must be owner!");
        if (msg.sender != i_owner) {revert NotOwner();}
        _;
    }

    // what happens if someone sends this contract ETH without calling the fund function
    // receive
       receive() external payable { 
        fund();
       }
    // fallback
    fallback() external payable { 
        fund();
    }
}
