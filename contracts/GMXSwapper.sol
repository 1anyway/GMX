// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
interface IGenericRouter {
    function swap(
        IUniversalRouter executor,
        SwapDescription calldata desc,
        bytes calldata permit,
        bytes calldata data
    ) external payable returns (
        uint256 returnAmount,
        uint256 spentAmount
    );
}
contract GMXSwapper is Ownable {
    address public constant WETH = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1; // wrapped ETH
    address public constant GMX = 0xfc5A1A6EB076a2C7aD06eD22C90d7E710E35ad0a;
    address public constant ROUTER_1INCH = 0x1111111254EEB25477B68fb85Ed929f73A960582;
    address public constant EXECUTOR = 0x64768A3a2453F1E8DE9e43e92D65Fc36E4c9872d;
    address public constant ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
    struct SwapDescription {
        IERC20 srcToken;
        IERC20 dstToken;
        address payable srcReceiver;
        address payable dstReceiver;
        uint256 amount;
        uint256 minReturnAmount;
        uint256 flags;
    }
    SwapDescription desc;
    desc.srcToken = IERC20(ETH);
    desc.dstToken = IERC20(GMX);
    desc.srcReceiver = EXECUTOR;
    desc.dstReceiver = address(this);
    desc.amount = msg.value;
    desc.minReturnAmount = 0;
    desc.flags = 0;
    desc.permit = bytes("");

    function _assertPreSwap(

    )

 function _executeSwap(
    address _receiver,
    address _tokenIn,
    address _tokenOut,
    uint256 _amountIn,
    bytes calldata _data
  ) internal override returns (uint256 _receivedAmount) {
    (IAggregationExecutor _caller, IOneInchExchange.SwapDescription memory _swapDescription, bytes memory _tradeData) = abi.decode(
      _data[4:],
      (IAggregationExecutor, IOneInchExchange.SwapDescription, bytes)
    );
    if (
      _swapDescription.dstReceiver != _receiver ||
      address(_swapDescription.srcToken) != _tokenIn ||
      address(_swapDescription.dstToken) != _tokenOut ||
      _swapDescription.amount != _amountIn ||
      _swapDescription.flags != _SHOULD_CLAIM_FLAG
    ) revert CommonErrors.IncorrectSwapInformation();
    IERC20(_tokenIn).approve(AGGREGATION_ROUTER_V3, 0);
    IERC20(_tokenIn).approve(AGGREGATION_ROUTER_V3, _amountIn);
    (_receivedAmount, ) = IOneInchExchange(AGGREGATION_ROUTER_V3).swap(_caller, _swapDescription, _tradeData);
  }
}
   
