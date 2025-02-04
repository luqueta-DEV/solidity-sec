# Solidity Security Project

Este projeto tem como objetivo demonstrar boas práticas de segurança em contratos inteligentes utilizando Solidity. Ele abrange tópicos essenciais como imutabilidade, privacidade, funções `pure`, e proteção contra ataques comuns, como reentrância e overflow.

## Tecnologias Utilizadas

- Solidity (versão 0.x)
- OpenZeppelin (para contratos e bibliotecas seguras)
- Hardhat (para desenvolvimento e testes)
- Ganache (para ambiente local de blockchain)

## Funcionalidades

Este projeto implementa várias estratégias para melhorar a segurança de contratos inteligentes, incluindo:

- **Imutabilidade**: Protege contratos contra alterações após a implantação.
- **Privacidade**: Técnicas para garantir a privacidade dos dados dentro de contratos.
- **Funções `pure`**: Uso adequado de funções `pure` para garantir que elas não alterem o estado do contrato.
- **Proteção contra reentrância**: Implementação de padrões como o "Checks-Effects-Interactions" para evitar ataques de reentrância.
- **Proteção contra Overflow/Underflow**: Utilização de bibliotecas de segurança para prevenir ataques de overflow em operações matemáticas.

## Como Rodar

### Pré-requisitos

Certifique-se de ter o Node.js e o Hardhat instalados. Caso não tenha, instale-os com os seguintes comandos:

```bash
solc --version
solc --bin --abi MyContract.sol -o output/
