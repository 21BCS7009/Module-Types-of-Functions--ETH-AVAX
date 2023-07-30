// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract Token is ERC20, Ownable {
    address private minter;
    bool private isPaused;

    constructor() ERC20("MAYANK", "MKV") {
        _mint(msg.sender, 1000); // Mint 1 MKV token (1000 is equivalent to 1 MKV)
        minter = msg.sender;
        isPaused = false;
    }

    modifier onlyMinter() {
        require(msg.sender == minter, "Action denied, only minter can perform this action.");
        _;
    }

    modifier whenNotPaused() {
        require(!isPaused, "Token transfers are currently paused.");
        _;
    }

    function setMinter(address newMinter) external onlyOwner {
        minter = newMinter;
    }

    function mint(address to, uint256 amount) external onlyMinter {
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function burnFrom(address account, uint256 amount) external onlyOwner {
        _burn(account, amount);
    }

    function transfer(address recipient, uint256 amount) public override whenNotPaused returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function pause() external onlyOwner {
        isPaused = true;
    }

    function unpause() external onlyOwner {
        isPaused = false;
    }

    function isTokenPaused() external view returns (bool) {
        return isPaused;
    }
}
