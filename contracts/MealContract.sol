pragma solidity ^0.4.8;
import "./Owned.sol";

contract MealContract is owned {
    
    address public owner;
    address public cook;
    uint public nSeats;
    uint public nParticipants;
    
    struct Participant {
        bool inMeal;
        bool confirmed;
    }
    
    mapping (address => Participant) participants;
    
    uint public nConfirmations;
    
    function MealContract(address _tokenContract, address _cook, uint _nSeats) {
        owner = _tokenContract;
        cook = _cook;
        nSeats = _nSeats;
    }
    
    function hasEmptySeats() constant returns(bool) {
        return (nParticipants < nSeats);   
    }
    
    function canBeClosed() constant returns(bool) {
        return (nConfirmations == nParticipants);
    }
    
    function addParticipant(address candidateAddress) onlyOwner returns (bool success) {
        require(candidateAddress != cook);
        
        Participant storage candidate = participants[candidateAddress];
        require(!candidate.inMeal);
    
        candidate.inMeal = true;
        candidate.confirmed = false;
        
        nParticipants += 1;
        
        return true;
    }
    
    function confirmMeal() returns (bool success) {
        Participant storage candidate = participants[msg.sender];
        require(candidate.inMeal);
        require(!candidate.confirmed);
        
        candidate.confirmed = true;
        nConfirmations += 1;
        
        return true;
    }
    
    function closeMeal() onlyOwner returns (bool success) {
        require(canBeClosed());

        selfdestruct(owner);
        return true;
    }
    
}