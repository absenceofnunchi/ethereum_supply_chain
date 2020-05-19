// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.24 <0.7.0;

// Import the library 'Roles'
import "./Roles.sol";


/// @title RetailRole
/// @dev Define a contract 'RetailerRole' to manage this role - add, remove, check
contract RetailerRole {
    using Roles for Roles.Role;

    /// @dev Define 2 events, one for Adding, and other for Removing
    event RetailerAdded(address indexed account);
    event RetailerRemoved(address indexed account);

    /// @dev Define a struct 'retailers' by inheriting from 'Roles' library, struct Role
    Roles.Role private retailers;

    /// @dev In the constructor make the address that deploys this contract the 1st retailer
    constructor() public {
        _addRetailer(msg.sender);
    }

    /// @dev Define a modifier that checks to see if msg.sender has the appropriate role
    modifier onlyRetailer() {
        require(isRetailer(msg.sender), "You're not a retailer");
        _;
    }

    /// @dev Define a function 'isRetailer' to check this role
    /// @param account The address of a retailer
    function isRetailer(address account) public view returns (bool) {
        retailers.has(account);
    }

    /// @dev Define a function 'addRetailer' that adds this role
    /// @param account The address of a retailer
    function addRetailer(address account) public onlyRetailer {
        _addRetailer(account);
    }

    /// @dev Define a function 'renounceRetailer' to renounce this role
    function renounceRetailer() public {
        _removeRetailer(msg.sender);
    }

    /// @dev Define an internal function '_addRetailer' to add this role, called by 'addRetailer'
    /// @param account The address of a retailer
    function _addRetailer(address account) internal {
        retailers.add(account);
        emit RetailerAdded(account);
    }

    /// @dev Define an internal function '_removeRetailer' to remove this role, called by 'removeRetailer'
    /// @param account The address of a retailer
    function _removeRetailer(address account) internal {
        retailers.remove(account);
        emit RetailerRemoved(account);
    }
}
