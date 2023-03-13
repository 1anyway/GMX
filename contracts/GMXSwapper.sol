// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract GMXSwapper is Ownable {

    address public constant WETH = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1; // wrapped ETH
    address public constant GMX = 0xfc5A1A6EB076a2C7aD06eD22C90d7E710E35ad0a;
    address public constant ROUTER_UNISWAP = 0x4C60051384bd2d3C01bfc845Cf5F4b44bcbE9de5;
    address public constant EXECUTOR = 0x64768A3a2453F1E8DE9e43e92D65Fc36E4c9872d;
    address public constant ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    constructor() {

    }

    function executeSwap(address _recevier, address _tokenIn, address _tokenOut, uint256 _amountIn) public {
      
    }


}