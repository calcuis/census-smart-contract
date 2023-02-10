# census-smart-contract

A smart contract written in Solidity programming language for conducting a poll on blockchain(s). 

```
//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Poll {
    address public owner;
    Candidate[] public candidates;
    uint public totalVotes;
    bool public isPaused;

    struct Candidate {
        string name;
        string image;
        uint countVotes;
    }

    struct Voter {
        bool authorised;
        uint whom;
        bool voted;
    }

    mapping(address => Voter) public voters;

...

```

The contract has the following properties:

`owner`: the address of the contract owner

`candidates`: an array of candidate structs that store information about each candidate in the poll

`totalVotes`: the total number of votes cast in the poll

`isPaused`: a boolean that determines if the poll is active or not

`voters`: a mapping of addresses to Voter structs that keep track of each voter's status

The contract defines two structs:

`Candidate`: a struct that stores the name, image, and count of votes for each candidate

`Voter`: a struct that stores whether a voter is authorized to vote, who they voted for, and whether they have voted

The contract uses a "modifier" named isOwner to ensure that only the contract owner can perform certain actions. Additionally, the contract has several require statements that enforce various rules, such as only allowing authorized voters to vote, or only allowing the contract owner to change the owner address.
