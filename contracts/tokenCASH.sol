// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
pragma experimental ABIEncoderV2;
import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";

contract myToken is ERC20PresetMinterPauser {
    constructor(string memory name, string memory symbol)
        public
        ERC20PresetMinterPauser(name, symbol)
    {}
}

contract HandleToken {
    myToken public tokenInstance;
    mapping(address => myToken) public listTokens;
    mapping(address => address) public owners;

    function createToken(string memory name, string memory symbol) public returns (myToken tokenInstance) {
        tokenInstance = new myToken(name, symbol);
        listTokens[address(tokenInstance)] = tokenInstance;
        owners[address(tokenInstance)] = msg.sender;
    }

    function mint(
        address token,
        address to,
        uint256 amount
    ) public {
        require(
            msg.sender == owners[token],
            "Ownable: You are not the owner, Bye."
        );
        listTokens[token].mint(to, amount);
    }

    function getToken() public view returns (address) {
        return address(tokenInstance);
    }

    function getOwner(address token) public view returns (address) {
        return (address(owners[token]));
    }
}
