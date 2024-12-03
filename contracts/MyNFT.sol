// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {

    uint public tokenId = 0;

    mapping (uint => address) ownership;

    constructor() ERC721("MyNFT", "MNFT") {}

    function mint(address _addr) public {
        ownership[tokenId] = _addr;
        _safeMint(_addr, tokenId++);
    }

    function burn(uint _tokenId) public {
        require(_tokenId < tokenId && msg.sender == ownership[_tokenId]);
        _burn(_tokenId);
    }

    function transfer(address _to, uint _tokenId) public {
        require(_tokenId < tokenId && msg.sender == ownership[_tokenId]);
        require(_to != address(0));
        _transfer(msg.sender, _to, _tokenId);
    }

}