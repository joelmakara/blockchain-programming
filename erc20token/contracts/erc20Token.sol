pragma solidity >=0.4.22 <0.6.0;

import "./erc20TokenInterface.sol";

contract erc20token is ERC20TokenInterface {
    
    uint8 public decimals;
    uint _totalSupply;
    
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    
    constructor() public {
        decimals = 18;
        _totalSupply = 1000000 * 10**uint(decimals);
        balances[tx.origin] = _totalSupply;
        emit Transfer(address(0), tx.origin, _totalSupply);
    }
    
    function totalSupply() public view returns (uint) {
        return (_totalSupply - balances[address(0)]);
    }
    
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }
    
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
    
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender] - tokens;
        balances[to] = balances[to] + tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
    
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
    
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = balances[from] - tokens;
        allowed[from][msg.sender] = allowed[from][msg.sender] - tokens;
        balances[to] = balances[to] + tokens;
        emit Transfer(from, to, tokens);
        return true;
    }
   
}