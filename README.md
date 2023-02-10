# census-smart-contract

a smart contract written in Solidity programming language for conducting a poll on blockchain(s). 

```
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
        bool authorized;
        uint whom;
        bool voted;
    }

    mapping(address => Voter) public voters;
    
    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }

...

```

the contract has the following properties:

`owner`: the address of the contract owner

`candidates`: an array of candidate structs that store information about each candidate in the poll

`totalVotes`: the total number of votes cast in the poll

`isPaused`: a boolean that determines if the poll is active or not

`voters`: a mapping of addresses to Voter structs that keep track of each voter's status

the contract defines two structs:

`Candidate`: a struct that stores the name and count of votes for each candidate

`Voter`: a struct that stores whether a voter is authorized to vote, who they voted for, and whether they have voted

an array of candidates `candidates`, which stores the information about the candidates in the poll. The information includes the candidate's name and number of votes received.

a mapping `voters` of addresses to voters' information, which stores information about voters, such as whether they are authorized to vote, for whom they have voted, and whether they have voted or not.

a modifier, named `isOwner` is used, to ensure that only the contract owner can perform certain actions. Additionally, the contract has several require statements that enforce various rules, such as only allowing authorized voters to vote, or only allowing the contract owner to change the owner address.
