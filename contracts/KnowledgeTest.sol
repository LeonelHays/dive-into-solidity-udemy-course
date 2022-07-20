//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {

    modifier ONLY_OWNER {
        require(msg.sender == owner, "ONLY_OWNER");
        _;
    }

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    string[] public tokens = ["BTC", "ETH"];
    address[] public players;

    function changeTokens() public {
        tokens[0] = "VET";
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string memory a, string memory b) external pure returns (string memory) {
        bytes memory concatByte = abi.encodePacked(a, b);
        string memory concatString = string(concatByte);
        return concatString;
    }

    function getBalance () public view returns (uint) {
        return address(this).balance;
    }

    function transferAll (address payable destination) public ONLY_OWNER {
        require(address(this).balance > 0, "no funds in contract");

        destination.transfer(address(this).balance);
    }

    receive () external payable {

    }

    fallback () external payable {

    }

}