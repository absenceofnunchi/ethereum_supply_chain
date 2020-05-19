// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.7.0;


/**
 * @title Roles
 * @dev Library for managing addresses assigned to a Role.
 */
library Roles {
    struct Role {
        mapping(address => bool) bearer;
    }

    /** @title Add */
    /// @dev give an account access to this role
    /// @param role The Role structure
    /// @param account The address of a role
    function add(Role storage role, address account) internal {
        require(
            account != address(0),
            "The account cannot be an uninitialized address"
        );
        require(!has(role, account), "Account already exists");

        role.bearer[account] = true;
    }

    /** @title remove */
    /// @dev remove an account's access to this role
    /// @param role The Role structure
    /// @param account The address of a role
    function remove(Role storage role, address account) internal {
        require(
            account != address(0),
            "Cannot remove an uninitialized account"
        );
        require(has(role, account), "Account doesn't exist");

        role.bearer[account] = false;
    }

    /** @title has */
    /// @dev check if an account has this role
    /// @param role The Role struct
    /// @param account The address of a role
    /// @return bool
    function has(Role storage role, address account)
        internal
        view
        returns (bool)
    {
        require(
            account != address(0),
            "Cannot look up an uninitialized account"
        );
        return role.bearer[account];
    }
}
