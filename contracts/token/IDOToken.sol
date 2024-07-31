
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract IDOToken is ERC20, Ownable {

    uint256 public idoPrice = 0.1 *10 ** 18;

    uint256 public maxBuyAmount = 100 * 10 ** 18;

    address public usdtAddress = 0x606D35e5962EC494EAaf8FE3028ce722523486D2;

    mapping(address => bool) private isBuy;

    // 构造函数：初始化ERC20代币的名称、符号，以及指定合约所有者
    constructor(address initialOwner) ERC20("AXS Token", "AXS") Ownable(initialOwner) {
        // 这里已经通过 Ownable(initialOwner) 调用了 Ownable 的构造函数
    }



    function buyToken(uint256 amount) public {
         // 确保用户还未购买过
      require(!isBuy[msg.sender], "You has already buy!");
      // 确保购买量不超过最大限制
      require(amount <= maxBuyAmount, "Invalid amount");

      // 从调用者地址转移 USDT 到合约地址
      IERC20(usdtAddress).transferFrom(msg.sender, address(this), amount);
      // 计算购买数量
      uint256 buyNum = amount / idoPrice * 10 ** 18;
      // 标记用户已购买
      isBuy[msg.sender] = true;

      // 铸造新的代币给调用者
      _mint(msg.sender, buyNum);
    }
    
    // 定义一个仅限所有者调用的提现函数
    function withdraw() public onlyOwner {
        // 获取合约地址中的 USDT 余额
        uint256 bal = IERC20(usdtAddress).balanceOf(address(this));
        // 将 USDT 余额转移给所有者
        IERC20(usdtAddress).transfer(msg.sender, bal);
    }


}