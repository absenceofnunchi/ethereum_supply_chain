// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.24 <0.7.0;

// Import the library 'Roles'
import "./Roles.sol";


/// @title ConsumerRole
/// @dev Define a contract 'ConsumerRole' to manage this role - add, remove, check
contract ConsumerRole {
    /// @dev attaching the library Roles to the Roles.Role type
    using Roles for Roles.Role;

    /// @dev Define 2 events, one for Adding, and other for Removing
    event ConsumerAdded(address indexed account);
    event ConsumerRemoved(address indexed account);

    /// @dev Define a struct 'consumers' by inheriting from 'Roles' library, struct Role
    Roles.Role private consumers;

    /// @dev In the constructor make the address that deploys this contract the 1st consumer
    constructor() public {
        _addConsumer(msg.sender);
    }

    /// @dev Define a modifier that checks to see if msg.sender has the appropriate role
    modifier onlyConsumer() {
        require(isConsumer(msg.sender), "This account is not a consumer");
        _;
    }

    /// @dev Define a function 'isConsumer' to check this role
    /// @param account The address to be checked for consumer
    /// @return bool Returns whether the address belongs to a consumer or not
    function isConsumer(address account) public view returns (bool) {
        return consumers.has(account);
    }

    /// @dev Define a function 'addConsumer' that adds this role
    /// @param account The address to be added as a consumer
    function addConsumer(address account) public onlyConsumer {
        _addConsumer(account);
    }

    /// @dev Define a function 'renounceConsumer' to renounce this role
    function renounceConsumer() public {
        _removeConsumer(msg.sender);
    }

    /// @dev Define an internal function '_addConsumer' to add this role, called by 'addConsumer'
    /// @param account The address to be added as consumer
    function _addConsumer(address account) internal {
        consumers.add(account);
        emit ConsumerAdded(account);
    }

    /// @dev Define an internal function '_removeConsumer' to remove this role, called by 'removeConsumer'
    /// @param account The addressed to be removed as a consumer
    function _removeConsumer(address account) internal {
        consumers.remove(account);
        emit ConsumerRemoved(account);
    }
}
