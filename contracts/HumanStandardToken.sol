import "./StandardToken.sol";
import "./MealContract.sol";

pragma solidity ^0.4.8;

contract HumanStandardToken is StandardToken,owned {
    string public name;                   //fancy name: eg Simon Bucks
    uint8 public decimals;                //How many decimals to show. ie. There could 1000 base units with 3 decimals. Meaning 0.980 SBX = 980 base units. It's like comparing 1 wei to 1 ether.
    string public symbol;                 //An identifier: eg SBX
    string public version = 'EXP-0.0.1';       //human 0.1 standard. Just an arbitrary versioning scheme.
    uint256 public buyPrice = 0.015 ether;
    uint256 public sellPrice = 0.0075 ether;
    uint public mealPrice = 1;
    
    mapping (address => bool) mealContracts;

    function HumanStandardToken(
        uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol
        ) {
        owner = msg.sender; 
        balances[msg.sender] = _initialAmount;               // Give the creator all initial tokens
        totalSupply = _initialAmount;                        // Update total supply
        name = _tokenName;                                   // Set the name for display purposes
        decimals = _decimalUnits;                            // Amount of decimals for display purposes
        symbol = _tokenSymbol;                               // Set the symbol for display purposes
    }

    /* Approves and then calls the receiving contract */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);

        //call the receiveApproval function on the contract you want to be notified. This crafts the function signature manually so one doesn't have to include a contract in here just for this.
        //receiveApproval(address _from, uint256 _value, address _tokenContract, bytes _extraData)
        //it is assumed that when does this that the call *should* succeed, otherwise one would use vanilla approve instead.
        require(_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData));
        return true;
    }

    
    function buy() payable returns (uint amount){
        amount = msg.value / buyPrice;                    // calculates the amount
        balances[msg.sender] += amount;                  // adds the amount to buyer's balance
        totalSupply += amount;
        Transfer(this, msg.sender, amount);               // execute an event reflecting the change
        
        require(owner.send((buyPrice - sellPrice)*amount));  // Send the owner the charitable donation of ETH
        
        return amount;                                    // ends function and returns
    }

    function sell(uint256 amount) returns (uint revenue){
        require(balances[msg.sender] >= amount);         // checks if the sender has enough to sell
        totalSupply -= amount;       
        balances[msg.sender] -= amount;                // subtracts the amount from seller's balance
        revenue = amount * sellPrice;
        require(msg.sender.send(revenue));                // sends ether to the seller: it's important to do this last to prevent recursion attacks
        Transfer(msg.sender, this, amount);               // executes an event reflecting on the change
        return revenue;                                   // ends function and returns
    }
    
    function createMeal(uint _nSeats) returns (address mealContractAddress) {
        require(balances[msg.sender] >= mealPrice);
        require(_nSeats >= 1);
        
        MealContract newMealContract = (new MealContract(this, msg.sender, _nSeats));
        mealContractAddress = address(newMealContract);
        
        balances[msg.sender] -= mealPrice;
        balances[mealContractAddress] += mealPrice;
        
        mealContracts[mealContractAddress] = true;
        
        return mealContractAddress;
    }
    
    function joinMeal(address mealContractAddress) returns (bool success) {
        require(balances[msg.sender] >= mealPrice);
        require(mealContracts[mealContractAddress]);

        MealContract mealContract = MealContract(mealContractAddress);
        require(mealContract.hasEmptySeats());
        require(mealContract.addParticipant(msg.sender));
        
        balances[msg.sender] -= mealPrice;
        balances[mealContractAddress] += mealPrice;
        
        return true;
    }
    
    function closeMeal(address mealContractAddress) returns (bool success) {
        require(mealContracts[mealContractAddress]);

        MealContract mealContract = MealContract(mealContractAddress);
        require(msg.sender == mealContract.cook());
        require(mealContract.closeMeal());
        
        balances[msg.sender] += balances[mealContractAddress];
        balances[mealContractAddress] = 0;
        
        mealContracts[mealContractAddress] = false;
        return true;
    }
    
    
}
