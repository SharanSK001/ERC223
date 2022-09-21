pragma solidity ^0.8.0;

import "./ERC223.sol";

contract ERC223Burnable is ERC223Token {
  
    function burn(uint256 _amount) public {
        balances[msg.sender] = balances[msg.sender] - _amount;
        _totalSupply = _totalSupply - _amount;
        
        bytes memory empty = hex"00000000";
        emit Transfer(msg.sender, address(0), _amount, empty);
    }
}
