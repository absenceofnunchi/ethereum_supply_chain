## Getting Started

The DApp uses Ethereum's smart contract technology on the blockchain to track your coffee from the farmers all the way to your hands. The consesus method of the blockchain allows the records on the supply chain to be transparent and accurate and the cryptographic hashing allows the parties involved to maintain their privacy.

1. Clone the repository

```
git clone https://github.com/igibliss00/ethereum_supply_chain.git
```

2. Install the node packages according to `package.json`

```
npm install
```

3. Configure the Infura Key and the mnemonic in `truffle-config.js`

```
const infuraKey = "<YOUR_INFURA>";
const mnemonic = "<Your_MNEMONIC>";
```

4. Compile and migrate

```
truffle develop
truffle compile
truffle migrate --reset --network rinkeby
```

5. Launch the website

```
npm run dev
```

6. Check the localhost

```
http://localhost:3000
```

## IPFS

Uploaded to the following address, but only reachable while my IPFS node is running

```
http://gateway.ipfs.io/ipfs/QmZGbU71yymA5nHMhRxDYYPJViiZ7WdZAmwjs2ML35hJ4Q
```

If you want to upload to your own node:

1. Download and install IPFS

```
https://docs.ipfs.io/guides/guides/install/
```

2. Initialize IPFS

```
ipfs init
```

3. Take your node online

```
ipfs daemon
```

4. While the IPFS daemon is running on another tab, publish the root directory (i.e. rootDirectory) of the clone

```
ipfs add -r rootDirectory
```

5. Access the website on your node with the very last hash value (\$hash)

```
http://127.0.0.1:8080/ipfs/$hash
```

## Etherscan

You can checked the deployed address of the contracts on Rinkeby Testnet

```
https://rinkeby.etherscan.io/address/0xc557db5a4adc104d64ffc539f87c14596ed26723
```
