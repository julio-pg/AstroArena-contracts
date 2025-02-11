// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract AstroArenaNFT is ERC1155, Ownable {
    using Strings for uint256;

    uint256 public constant NEBULA_WISP = 1;
    uint256 public constant PLASMA_DRONE = 2;
    uint256 public constant QUANTUM_BEAST = 3;
    uint256 public constant CYBER_WYRM = 4;
    uint256 public constant VOID_REAPER = 5;

    string private _baseURI;

    constructor(string memory baseURI, address initialOwner) ERC1155(baseURI) Ownable(initialOwner) {
        _baseURI = baseURI;
    }

    function mint(address to, uint256 tokenId, uint256 amount) public onlyOwner {
        _mint(to, tokenId, amount, "");
    }

    function mintBatch(address to, uint256[] memory tokenIds, uint256[] memory amounts) public onlyOwner {
        _mintBatch(to, tokenIds, amounts, "");
    }

    function uri(uint256 tokenId) public view override returns (string memory) {
        return string(abi.encodePacked(_baseURI, tokenId.toString(), ".json"));
    }

    function setBaseURI(string memory newBaseURI) public onlyOwner {
        _baseURI = newBaseURI;
    }
}