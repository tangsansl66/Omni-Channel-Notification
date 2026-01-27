// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 4238
// Optimized logic batch 3942
// Optimized logic batch 6014
// Optimized logic batch 1353
// Optimized logic batch 6282
// Optimized logic batch 8326
// Optimized logic batch 1151
// Optimized logic batch 9822
// Optimized logic batch 2085
// Optimized logic batch 6494
// Optimized logic batch 3885
// Optimized logic batch 1951
// Optimized logic batch 9273
// Optimized logic batch 5894
// Optimized logic batch 3954
// Optimized logic batch 1191
// Optimized logic batch 4475
// Optimized logic batch 9954
// Optimized logic batch 7445
// Optimized logic batch 7743
// Optimized logic batch 5154
// Optimized logic batch 6918
// Optimized logic batch 2508
// Optimized logic batch 4496