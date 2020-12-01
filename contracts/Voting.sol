pragma solidity ^0.6.0;


import "@openzeppelin/contracts/math/SafeMath.sol";

contract Voting {

    using SafeMath for uint256;

    // 投票结果数组
    mapping(address => string) votingResult;

    uint256 trumpTotalBallots = 0;
    uint256 bidenTotalBallots = 0;

    address[] public accounts;

    bool isVoted = false;

    uint256 votedAt = 0;

    // 接受ETH捐赠
    constructor() public payable {}

    function donate() public payable{}

    // 投票给候选人 Trump or Biden
    function like(string memory candidate ) public returns (bool) {
        require(msg.sender != address(0), "Sender not authorized.");

        // 检查投票人是否已经投票
        if(accounts.length > 0) {
            for (uint256 i=0; i<accounts.length; i++) {
                if(msg.sender == accounts[i]) {
                    isVoted = true;
                }
            }
        }

        // 注册投票
        if( isVoted == false && keccak256(bytes(votingResult[msg.sender])) == keccak256(bytes("")) ) {
            votingResult[msg.sender] = candidate;
            accounts.push(msg.sender);
        }

        return true;
    }

    function _toLower(string memory str) internal pure returns (string memory) {
        bytes memory bStr = bytes(str);
        bytes memory bLower = new bytes(bStr.length);

        for (uint i = 0; i < bStr.length; i++) {
            // Uppercase character...
            if ((uint8(bStr[i]) >= 65) && (uint8(bStr[i]) <= 90)) {
                // So we add 32 to make it lowercase
                bLower[i] = bytes1(uint8(bStr[i]) + 32);
            } else {
                bLower[i] = bStr[i];
            }
        }

        return string(bLower);
    }

    //获取总投票数
    function getBallotCount(string memory candidate) public view returns(uint256) {
        string memory trumpName = "trump";
        string memory bidenName = "biden";

        require( keccak256(abi.encode(candidate)) == keccak256(abi.encode(trumpName)) || keccak256(abi.encode(candidate)) == keccak256(abi.encode(bidenName)), "Wrong Candidate!");

        return keccak256(abi.encode(candidate)) ==  keccak256(abi.encode(trumpName)) ? trumpTotalBallots : bidenTotalBallots;
    }

    // ETH 提现
    function withdraw() public pure returns(bool) {
        return true;
    }
}
