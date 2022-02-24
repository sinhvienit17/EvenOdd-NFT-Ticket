// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
interface IMasterCash is IERC721Enumerable{
    function getDueDate(uint tokenId) external view returns (uint256);
}