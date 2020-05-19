// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.24 <0.7.0;

// Import the library 'Roles'
import "./Roles.sol";


/// @title FarmerRole
/// @dev Define a contract 'FarmerRole' to manage this role - add, remove, check
contract FarmerRole {
    /// @dev attaching the library Roles to the Roles.Role type
    using Roles for Roles.Role;

    /// @dev Define 2 events, one for Adding, and other for Removing
    /// @param account The account of a farmer
    event FarmerAdded(address indexed account);
    event FarmerRemoved(address indexed account);

    /// @dev Define a struct 'farmers' by inheriting from 'Roles' library, struct Role
    Roles.Role private farmers;

    /// @dev In the constructor make the address that deploys this contract the 1st farmer
    constructor() public {
        _addFarmer(msg.sender);
    }

    /// @dev Define a modifier that checks to see if msg.sender has the appropriate role
    modifier onlyFarmer() {
        require(isFarmer(msg.sender), "You're not a farmer");
        _;
    }

    /// @dev Define a function 'isFarmer' to check this role
    /// @param account The account of a potential farmer
    /// @return bool Whether the account is registered as a farmer in farmer's mapping
    function isFarmer(address account) public view returns (bool) {
        return farmers.has(account);
    }

    /// @dev Define a function 'addFarmer' that adds this role
    /// @param account The address of a farmer
    function addFarmer(address account) public onlyFarmer {
        _addFarmer(account);
    }

    /// @dev Define a function 'renounceFarmer' to renounce this role
    function renounceFarmer() public {
        _removeFarmer(msg.sender);
    }

    /// @dev Define an internal function '_addFarmer' to add this role, called by 'addFarmer'
    /// @param account The address of a farmer
    function _addFarmer(address account) internal {
        farmers.add(account);
        emit FarmerAdded(account);
    }

    /// @dev Define an internal function '_removeFarmer' to remove this role, called by 'removeFarmer'
    /// @param account The address of a farmer
    function _removeFarmer(address account) internal {
        farmers.remove(account);
        emit FarmerRemoved(account);
    }
}
