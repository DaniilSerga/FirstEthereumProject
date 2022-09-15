// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Shop {
    address public owner;
    mapping (address => uint) public payements;

    constructor() {
        owner = msg.sender;
    }

    function payForItem() public payable {
        payements[msg.sender] = msg.value;
    }

    function withdrawAll() public {
        address payable _to = payable(owner);
        address _thisContract = address(this);
        
        _to.transfer(_thisContract.balance);
    }
}