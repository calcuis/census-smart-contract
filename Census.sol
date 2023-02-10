//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Census {
    address public owner;
    Candidate[] public candidates;
    uint public totalVotes;
    bool public isPaused;

    struct Candidate {
        string name;
        uint countVotes;
    }

    struct Voter {
        bool authorised;
        uint whom;
        bool voted;
    }

    mapping(address => Voter) public voters;

    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addCandidate(string memory _candidateName) public isOwner {
        candidates.push(Candidate(_candidateName, 0));
    }

    function pausePoll() public isOwner {
        isPaused = true;
    }

    function activatePoll() public isOwner {
        isPaused = false;
    }

    function selfRegister() public {
        require(!isPaused);
        voters[msg.sender].authorised = true; 
    }

    function getTotalVotes() public view returns(uint) {
        return totalVotes;
    }

    function getTotalCandidates() public view returns(uint) {
        return candidates.length;
    }

    function getCandidate(uint _id) public view returns(Candidate memory) {
        return candidates[_id];
    }

    function vote(uint _id) public {
        require(!isPaused);
        require(!voters[msg.sender].voted);
        require(voters[msg.sender].authorised);
        voters[msg.sender].whom = _id;
        voters[msg.sender].voted = true;
        candidates[_id].countVotes++;
        totalVotes++;
    }
}
