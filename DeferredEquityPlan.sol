pragma solidity ^0.5.0;

contract DeferredEquityPlan {
    address human_resources;
    
    address payable employee;
    bool active = true;
    
    uint start_time = now;
    
    uint public distributed_shares;
    
    constructor(address payable _employee) public {
        human_resources = msg.sender;
        employee = _employee;
    }
    
    function distribute() public {
        require(msg.sender == human_resources || msg.sender == employee, "Nice try! You are not permitted to execute this contract.");
        require(active == true, "Contract not active");
        
        if (distributed_shares > 1000) {
            distributed_shares = 1000;
        }
    }
    
    function deactivate() public {
        require(msg.sender == human_resources || msg.sender == employee, "Nice try! You are not permitted to execute this contract.");
        active = false;
    }
    
    function() external payable {
        revert ("Do not transfer Ether to this address");
    }