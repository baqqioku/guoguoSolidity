
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract AxsToken is Initializable, ERC20Upgradeable, OwnableUpgradeable {

    function initialize(address initialOwner) initializer public {
        __ERC20_init("Axs Token", "AXS");
        __Ownable_init(initialOwner);
    }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function setOwner(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

}
