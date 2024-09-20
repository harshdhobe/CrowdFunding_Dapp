// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract CrowdFunding {
    struct Campaign{
        address owner;
        string title;
        string description;
        uint target;
        uint deadline;
        string image;
        uint amountCollected;
        address[] donators;
        uint [] donations;
    }
     
     mapping (uint =>Campaign) campaigns;
    uint public numberOfCampaigns=0;
    
    function createCampaign(address _owner,
    string memory _title,
    string memory _description,
    uint _target,
    uint _deadline,
    string memory _image
    ) public returns(uint256) {
        Campaign storage campaign=campaigns[numberOfCampaigns];

        require(Campaign.deadline < block.timestamp, "deadline should be in future");

        campaign.owner = _owner;
        campaign.title = _title;
        campaign.description = _description;
        campaign.target = _target;
        campaign.deadline = _deadline;
        campaign.amountCollected = 0;
        campaign.image = _image;

        numberOfCampaigns++;
        return numberOfCampaigns - 1;
        
    }

    function donateToCampaign(uint _id)public payable {
        uint amount=msg.value;

        (bool sent, )=payable(Campaign.owner).call{value:amount}("");

        if(sent){
            Campaign.amountCollected= Campaign.amountCollected+amount;
        }

        Campaign.donators.push(msg.sender);
        Campaign.donations.push(amount);
        
    }

     function getDonators(uint256 _id) view public returns (address[] memory, uint256[] memory) {
        return (campaigns[_id].donators, campaigns[_id].donations);
    }

    function getCampaigns()public view returns(Campaign[] memory) {
        Campaign[] memory allCampaigns = new Campaign[](numberOfCampaigns);

        for(uint i = 0; i < numberOfCampaigns; i++) {
            Campaign storage item = campaigns[i];

            allCampaigns[i] = item;
        }

        return allCampaigns;

    }

}
