// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract CrowdFunding {
    struct Campaign{
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadline;
        uint256 amountCollected;
        address[] donators;
         address[] donations;
    }




}
