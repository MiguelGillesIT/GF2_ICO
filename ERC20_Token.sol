pragma solidity ^0.6.0 ;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/math/SafeMath.sol";


contract ERC20{
    
    using SafeMath for uint;
    string internal name; 
    string internal symbol; 
    uint8 internal decimals;

    uint256 internal _totalSupply;

    mapping(address => uint256) balances; 
    mapping(address => mapping (address => uint256)) allowed;



    function totalSupply() public view returns (uint256){
        return _totalSupply;
    } 


    function balanceOf(address tokenOwner) public view returns (uint){
        return balances[tokenOwner];
    } 


    function allowance(address owner, address delegate) public view returns (uint) { 
        return allowed[owner][delegate]; 
    } 
    
    function transfer(address receiver, uint numTokens) public returns (bool){
        require(numTokens <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens); 

        emit Transfer(msg.sender, receiver, numTokens); 
        return true;
    } 

    function approve(address delegate, uint numTokens) public returns (bool) { 
        allowed[msg.sender][delegate] = numTokens; 
        emit Approval(msg.sender, delegate, numTokens); 
        return true; 
    }

    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) { 
            require(numTokens <= balances[owner]); 
            require(numTokens <= allowed[owner][msg.sender]); 

            balances[owner] = balances[owner].sub(numTokens); 
            allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens); 
            balances[buyer] = balances[buyer].add(numTokens);

            emit Transfer(owner, buyer, numTokens); 
            return true;
            }
    
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens); 
    event Transfer(address indexed from, address indexed to, uint tokens); 
    }