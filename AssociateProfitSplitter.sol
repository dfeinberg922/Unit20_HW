pragma solidity ^0.5.0;

contract AssociateProfitSplitter {
    address payable owner = msg.sender;
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;
    
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }
    
    function balance() public view returns(uint) {
        return address(this).balance;
    }
    
    function deposit() public payable {
        require(msg.sender == owner, "Looks like you don't have authorization to make a deposit");
        uint amount = msg.value / 3;
    
    employee_one.transfer(amount);
    employee_two.transfer(amount);
    employee_three.transfer(amount);
    
    msg.sender.transfer(msg.value - amount * 3);
    }
    
    function() external payable {
        deposit();
    }
    
}