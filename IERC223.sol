pragma solidity ^0.8.0;

abstract contract IERC223 {
    
    function name()        public view virtual returns (string memory);
    function symbol()      public view virtual returns (string memory);
    function standard()    public view virtual returns (string memory);
    function decimals()    public view virtual returns (uint8);
    function totalSupply() public view virtual returns (uint256);
    
   
    function balanceOf(address who) public virtual view returns (uint);
        

    function transfer(address to, uint value) public virtual returns (bool success);

    function transfer(address to, uint value, bytes calldata data) public virtual returns (bool success);
     

    event Transfer(address indexed from, address indexed to, uint value);

    event TransferData(bytes data);
}
