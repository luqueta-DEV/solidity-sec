//SPDX-license-Identifier:MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract security {

    mapping (address => uint256) private balances;

    event Deposit (address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);

    function Deposit() external payable {
        require (msg.sender > 0, "deposito deve ser maior que 0");
        balances [msg.sender] += msg.value;
        emit Deposit(msg.sender,msg.value);
    }

    function Withdraw(uint256 amout ) external nonReentrant {
      require(amount>0, "valor invalido");
      require(balances[msg.sender ]>= amount, "saldo invalido man");

      balances[msg.sender] -= amount;
      payable(msg.sender).transfer(amount);
      
    emit Withdraw((msg.sender, amount));


    }

    function getBalance(address user) external view returns (uint256) {
    return balances[user];
    }

    function calculateFee (uint256, amount) extermal pure returns (uint256) {
        return (amount *  5 ) /100; // 5% de taxa
    }

   


    

}