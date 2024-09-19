// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract CrowdFunding {
     string public title;
    uint public requiredAmount;
    string public image;
    string public story;
    address payable public owner;
    uint public receivedAmount;

     event donated(address indexed donar, uint indexed amount, uint indexed timestamp);

      constructor(
        string memory campaignTitle, 
        uint requiredCampaignAmount, 
        string memory imgURI,
        string memory storyURI,
        address campaignOwner
    ) {
        title = campaignTitle;
        requiredAmount = requiredCampaignAmount;
        image = imgURI;
        story = storyURI;
        owner = payable(campaignOwner);
    }


    
   
    




}
