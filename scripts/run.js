// creates smart contract 

const main = async () => {
      // compiles our contract and generate necessary files, will be in artifcats folder
      const nftContractFactory = await hre.ethers.getContractFactory('JooleeNFT')
      
      // creates local Eth network but just for this contract
      // after compilation, it'll destroy network. everytime i run the contract,
      // it'll be a fresh blockchain
      // it's like refreshing your local server everytime so u always start from clean slate,
      // makes it easy to debug errors
      const nftContract = await nftContractFactory.deploy()

      // wait til contract is mined and deployed to blockchain
      await nftContract.deployed()
      console.log("Contract deployed to:", nftContract.address)

      // call func
      let txn = await nftContract.makeJOONFT()
      // wait for it to be mined
      await txn.wait()
}

const runMain = async () => {
      try {
            await main()
            process.exit(0)
      } catch (error) {
            console.log(error)
            process.exit(1)
      }
}

runMain()