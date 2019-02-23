pragma solidity ^0.4.25;

contract UserPermissions {
  address owner;
  mapping(address => bool) permission;

  constructor  () public {
    owner = msg.sender;
  }
  
 

  function assignPermission (address account) onlyOwner(account) public {
    require(account != address(0));
    permission[account] = true;
      }
  
 
   
  function hasPermission (address account) onlyOwner(account) public view returns (bool) {
    require(account != address(0));
    return permission[account];
  }
  

  modifier onlyOwner (address account) {
    if ( (account == owner) && msg.sender != owner) {
      revert();
    }
    _;
  }
}