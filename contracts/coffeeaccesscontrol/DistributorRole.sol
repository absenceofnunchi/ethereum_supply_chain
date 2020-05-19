// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.24 <0.7.0;

// Import the library 'Roles'
import "./Roles.sol";


/// @title DistributorRole
/// @dev Define a contract 'DistributorRole' to manage this role - add, remove, check
contract DistributorRole {
    /// @dev attaching the library Roles to the Roles.Role type
    using Roles for Roles.Role;

    /// @dev Define 2 events, one for Adding, and other for Removing
    /// @param account The account of a distributor
    event DistributorAdded(address indexed account);
    event DistributorRemoved(address indexed account);

    /// @dev Define a struct 'distributors' by inheriting from 'Roles' library, struct Role
    Roles.Role private distributors;

    /// @dev In the constructor make the address that deploys this contract the 1st distributor
    constructor() public {
        _addDistributor(msg.sender);
    }

    /// @dev Define a modifier that checks to see if msg.sender has the appropriate role
    modifier onlyDistributor() {
        require(isDistributor(msg.sender), "You're not a distributor");
        _;
    }

    /// @dev Define a function 'isDistributor' to check this role
    /// @param account The address of a potential distributor
    /// @return bool Determines whether the address belongs to a distributor or not
    function isDistributor(address account) public view returns (bool) {
        return distributors.has(account);
    }

    /// @dev Define a function 'addDistributor' that adds this role
    /// @param account The address that is to belong to a distributor
    function addDistributor(address account) public onlyDistributor {
        _addDistributor(account);
    }

    /// @dev Define a function 'renounceDistributor' to renounce this role
    function renounceDistributor() public {
        _removeDistributor(msg.sender);
    }

    /// @dev Define an internal function '_addDistributor' to add this role, called by 'addDistributor'
    /// @param account The account to be added as a distributor
    function _addDistributor(address account) internal {
        distributors.add(account);
        emit DistributorAdded(account);
    }

    /// @dev Define an internal function '_removeDistributor' to remove this role, called by 'removeDistributor'
    /// @param account The account to be removed as a distributor
    function _removeDistributor(address account) internal {
        distributors.remove(account);
        emit DistributorRemoved(account);
    }
}
