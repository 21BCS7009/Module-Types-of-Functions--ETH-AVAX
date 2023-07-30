# Module-Types-of-Functions--ETH-AVAX

The provided code is the Solidity smart contract for an ERC20 token called "MAYANK" with the symbol "MKV." This token contract is implemented using OpenZeppelin libraries and includes functionalities such as minting, burning, pausing, and unpausing token transfers. Below is the README.md file that describes the contract:

### MAYANK Token (MKV)
MAYANK (MKV) is an ERC20 standard token implemented on the Ethereum blockchain. The contract is based on the OpenZeppelin library, which provides secure and tested implementations of widely used smart contract patterns.

## Contract Details

Name: MAYANK

Symbol: MKV

Decimals: 18 (The token has 18 decimal places, which means 1 MKV token is represented as 1000000000000000000)
Total Supply: 1000 MKV tokens (Minted during deployment)

## Functionalities
The contract provides the following functionalities:

### Minting
The contract creator, who is initially set as the "minter," can create new MKV tokens and assign them to any Ethereum address. Only the minter can perform this action. The total supply of 1000 MKV tokens is minted during the contract's deployment.

### Burning
Token holders can burn their own MKV tokens, effectively reducing their balance. Additionally, the contract owner (the contract deployer) has the authority to burn MKV tokens from any address. This functionality can be used to remove tokens from circulation.

### Pausing and Unpausing Token Transfers
The contract owner can pause and unpause token transfers. When token transfers are paused, no one can perform token transfers until they are unpaused. This feature can be useful in emergency situations or to prevent token transfers during critical contract updates.

### Deployment
To deploy the MAYANK (MKV) token contract, you need to use an Ethereum development environment (e.g., Remix, Truffle, or Hardhat) and an Ethereum account with sufficient Ether to cover the gas fees. Deploying the contract will mint the initial supply of 1000 MKV tokens and set the contract deployer as the minter.

## Usage
To use the contract, you can interact with it through the provided external functions:

1. transfer: Allows token holders to transfer MKV tokens to other addresses. Transfers are only allowed when the contract is not paused.
   ```
   function transfer(address recipient, uint256 amount) public override whenNotPaused returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
   ```
   
2. mint: Can only be called by the minter to create and assign new MKV tokens to any Ethereum address.
   ```
   function mint(address to, uint256 amount) external onlyMinter {
        _mint(to, amount);
    }
   ```
   
3. burn: Token holders can burn their own MKV tokens to reduce their balance.
   ```
   function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
   ```
   
4. burnFrom: The contract owner can burn MKV tokens from any address to remove tokens from circulation.
   ```
   function burnFrom(address account, uint256 amount) external onlyOwner {
        _burn(account, amount);
    }
   ```
   
5. pause: The contract owner can pause token transfers, temporarily disabling all transfers.
   ```
   function pause() external onlyOwner {
        isPaused = true;
    }
   ```
   
6. unpause: The contract owner can unpause token transfers, re-enabling token transfers after a pause.
   ```
   function unpause() external onlyOwner {
        isPaused = false;
    }
   ```

7. isTokenPaused: An external view function that returns the current state of the isPaused flag.
   ```
      function isTokenPaused() external view returns (bool) {
        return isPaused;
      }
   ```

8. setMinter: An external function that allows the contract owner to change the minter's address. Only the contract owner can call this function
    ```
       function setMinter(address newMinter) external onlyOwner {
        minter = newMinter;
    }
    ```
     
### Security
The contract leverages the tested and audited OpenZeppelin libraries to ensure secure and reliable token functionality. However, as with any smart contract deployment, it is crucial to perform your own security audits and testing before using the contract in any production environment.

## Authors
ex. Mayank Varshney (21BCS7009)

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/21BCS7009/Module-Types-of-Functions--ETH-AVAX/blob/main/LICENSE) file for details.
