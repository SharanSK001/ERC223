pragma solidity ^0.8.0;

import "./IERC223.sol";
import "./IERC223Recipient.sol";
import "Assignment-ERC223/utils/Address.sol";

contract ERC223Token is IERC223 {

    string  private _name;
    string  private _symbol;
    uint8   private _decimals;
    uint256 private _totalSupply;
    
    mapping(address => uint256) public balances; 
    constructor(string memory new_name, string memory new_symbol, uint8 new_decimals)
    {
        _name     = new_name;
        _symbol   = new_symbol;
        _decimals = new_decimals;
    }

    function standard() public pure override returns (string memory)
    {
        return "erc223";
    }

    function name() public view override returns (string memory)
    {
        return _name;
    }

    function symbol() public view override returns (string memory)
    {
        return _symbol;
    }

    function decimals() public view override returns (uint8)
    {
        return _decimals;
    }


    function totalSupply() public view override returns (uint256)
    {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view override returns (uint256)
    {
        return balances[_owner];
    }
    
    function transfer(address _to, uint _value, bytes calldata _data) public override returns (bool success)
    {
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
        if(Address.isContract(_to)) {
            IERC223Recipient(_to).tokenReceived(msg.sender, _value, _data);
        }
        emit Transfer(msg.sender, _to, _value);
        emit TransferData(_data);
        return true;
    }
    
   
    function transfer(address _to, uint _value) public override returns (bool success)
    {
        bytes memory _empty = hex"00000000";
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
        if(Address.isContract(_to)) {
            IERC223Recipient(_to).tokenReceived(msg.sender, _value, _empty);
        }
        emit Transfer(msg.sender, _to, _value);
        emit TransferData(_empty);
        return true;
    }
}
