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
    mapping (string => bool) public _authorizedToDestroy;

    constructor() ERC721("Factory NFT", "FTN") {
    }

    function createToken(string memory tokenURI) public returns (uint) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        // every metadata like dueDate, owedAmount can be encoded in the tokenURI but for the sake of simplicty, I'll leave it like this
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function setAuthorizedToDestroy(address _wallet, uint256 tokenId) public  {
        _authorizedToDestroy[string(abi.encodePacked(_wallet, tokenId))] = true;
    }

    function isAuthorized(address _wallet, uint256 tokenId) public view returns (bool){
        return _authorizedToDestroy[string(abi.encodePacked(_wallet, tokenId))];
    }

    function destroyDebt (address _wallet, uint256 tokenId) public {
        require(isAuthorized(_wallet, tokenId), "User is not authorized");
        require(_wallet != ownerOf(tokenId), "You cannot destroy your own debt");
        _burn(tokenId);
    }
}