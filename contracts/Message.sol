// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

contract Message {
    address public owner;

    string public message;

    constructor() {
        owner = msg.sender;
    }

    event MessageSet(address setter, string message);
    event OwnershipTransfered(address previousOwner, address newOwner);

    function setMessage(string memory _message) public {
        require(msg.sender != address(0), "You can't set your own message");
        require(msg.sender == owner, "You are not the owner");
        message = _message;
        emit MessageSet(msg.sender, message);
    }

    function getMessage() public view returns (string memory) {
        return message;
    }

    function transferOwnership(address _newOwner) public {
        require(msg.sender == owner, "You aren't the owner");
        require(
            _newOwner != address(0),
            "You can't transfer ownership to the zero address"
        );
        owner = _newOwner;
    }
}
