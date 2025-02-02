//SPDX-license-Identifier:MIT
pragma solidity ^0.8.7;

import "node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "node_modules/@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract MasterpieceContract is Ownable, ReentrancyGuard {

using SafeMath for uint256;

    mapping (address => uint256) private balances;
    mapping (address => uint256) private lockBalances;

    event Deposit (address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);
    event Transfer(address indexed user, uint256 amount);


    function deposit () external payable nonReentrant {
    require(msg.value>0, "valor depositado deve ser maior que 0");

     balances[msg.sender] = balance[msg.sender]. add(msg.value);
     emit deposit (msg.sender,msg.value);

    }

    function Withdraw(uint256 amout ) external nonReentrant {
      require(amount>0, "valor invalido");
      require(balances[msg.sender ]>= amount, "saldo invalido man");
      
    balances[msg.sender] = balances[msg.sender.sub(amount)];
    payable(msg.sender).transfer(amount);
    emit Withdraw(msg.sender, amount);
    }

function enviaEther(address to, uint256 amount) external nonReentrant {
require(to != adddress(0), "endereco invalido");
require(amount>0, "valor insuficiente");
require(balances[msg.sender]>= amount,"saldo insuficiente");

balances[msg.sender] = balances[msg.sender].sub(amount);
balances[to] = balances[to].add(amount);

emit Transfer(msg.sender,to,amount);

}

function lockBalances(uint256 amount) external nonReentrant {
require (amount > 0, "Valor Invalido");
require (balances[msg.sender]>= amount, "saldo insuficiente");

balances[msg.sender] = balances[msg.sender].sub(amount);
lockedBalances(msg.sender) = lockedBalances[msg.sender].add (amount);

}

function unlockBalance(uint256 amount) external nonReentrant {
 require(amount > 0, "valor invalido");
 require(lockedBalances[msg.sender] >= amount, "saldo bloqueado insuficiente");

lockedBalances[msg.sender] = lockedBalances[msg.sender].sub (amount);
balances[msg.sender] = balances[msg.sender].add(amount);


}

 function emergencyWithdraw(uint256 amount) external onlyOwner {
        require(amount <= address(this).balance, "Saldo insuficiente no contrato");
        payable(owner()).transfer(amount);
    }


function lockedBalancesOf(address user) external view returns (uint256) {
  return lockedBalances[user];  
}

 function transferERC20(address tokenAddress, address to, uint256 amount) external nonReentrant {
        IERC20 token = IERC20(tokenAddress);
        require(token.balanceOf(msg.sender) >= amount, "Saldo insuficiente de tokens");
        require(token.transferFrom(msg.sender, to, amount), "Transferencia falhou");
    }
    



}
