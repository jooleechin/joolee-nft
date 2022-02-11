// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// inherit contract important, so we can inhert contract's methods
contract JooleeNFT is ERC721URIStorage{
    // openzep helps us keep track of tockenIds
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // ERC721: NFT standard 
    // pass name of NFT token and symbol
    constructor() ERC721 ("JooleeNFT", "JOO") {
        console.log("This is my NFT contract. Whoa!");
    }

    // to get NFT
    function makeJOONFT() public {
        // get current tokenId, start at 0. counter for NFT version
        uint256 newItemId = _tokenIds.current();

        // mind NFT to sender using msg.sender
        // _tokenIds is a state var and value is stored on contractds
        _safeMint(msg.sender, newItemId);

        // set NFT's data
        _setTokenURI(newItemId, "blah");

        // increment counter for when next NFT is minted
        _tokenIds.increment();
    }2
}