pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTContract is ERC721URIStorage { 

    using Counters for Counters.Counter; 
    Counters.Counter private _tokenIds;

    uint _owedAmount = 100;
    uint _owedUnits = 100;
    uint _startTimer = 0;
    uint _dueDate = 123034095094;
    address _debtor;
    address[] _authorizedToDestroy;

    constructor() ERC721("Factory NFT", "FTN") {
    }

    function createToken() public returns (uint) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        string memory signature = string(abi.encodePacked("I accept the debt of 100 DAI and agree to pay the holder in full on or before 25/02/2022"));
        _setTokenURI(newItemId, signature);

        return newItemId;
    }
}