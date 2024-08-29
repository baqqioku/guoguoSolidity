

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Project {
    enum ProjectState {Ongoing,Successful,Failed}

    struct Donation {
        address donor;
        uint256 amount;
    }

    address public creator;
    string public description;
    uint256 public goalAmount;
    uint256 public deadline;
    uint256 public currentAmount;
    ProjectState public state;
    Donation[] public donations;

    event DonationReceived(address indexed donor,uint256 amount);

    event ProjectStateChanged(ProjectState newState);

    event FoundWithdraw(address indexed creator,uint256 amount);

    event FoundRefunded(address indexed donor,uint256 amount);

    modifier onluCreator(){
        require(msg.sender == creator, "Not the project creator");  
        _;
    }

    modifier onlyAfterDealine(){
        require(block.timestamp>=deadline,"Project is still ongoling");
        _;
    }

    function initialize (address _creator,string memory _description,uint256 _goalAmount,uint256 _duration) public {
        creator = _creator;
        description = _description;
        goalAmount = _goalAmount;
        deadline = block.timestamp +_duration;
        state = ProjectState.Ongoing;
    }

    function donate() external payable {
        require(state == ProjectState.Ongoing,"Project is no ongoing");
        require(block.timestamp < deadline,"Project deadline has passed");

        donations.push(Donation({
            donor :msg.sender,
            amount: msg.value
        }));

        currentAmount +=msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }

    function refund() external onlyAfterDealine {
        require(state == ProjectState.Failed,"Project is not failed");
        uint256 totalRefund = 0;
        for(uint256 i=0;i< donations.length;i++){
            if(donations[i].donor == msg.sender){
                totalRefund += donations[i].amount;
                donations[i].amount = 0;
            }
        }
        require(totalRefund>0,"not found to refund");
        payable (msg.sender).transfer(totalRefund);
        emit FoundRefunded(msg.sender, totalRefund);
    }

    function updateProjectState() external onlyAfterDealine {
        require(state == ProjectState.Ongoing,"Project is already finalized");
        if(currentAmount >= goalAmount){
            state = ProjectState.Successful;
        }else {
            state = ProjectState.Failed;
        }

        emit ProjectStateChanged(state);


    }



}