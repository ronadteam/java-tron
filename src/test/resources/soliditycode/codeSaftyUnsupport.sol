//pragma solidity ^0.4.24;

contract SubC {

event log(string);

function () payable external{}

function receiveToken() payable public{}

function getBalance() view public returns (uint256 r) {
r = address(this).balance;
}
}

contract UseDot {
constructor() payable public{}
function() payable external{}
mapping(address => mapping(trcToken => uint256)) sender_tokens;

function trigger1(address addr) payable public {
// SubC(addr).call.value(1000).tokenId(0x6e6d62)(bytes4(sha3("receiveToken()"))); // ERROR
}

function trigger2(address addr) payable public {
// addr.transferToken.value(10)(10, 0x6e6d62); // ERROR
}

function trigger3(address addr) payable public {
// SubC(addr).receiveToken.tokenvalue(10)(); // ERROR
}

function trigger4(address addr) payable public {
// SubC(addr).receiveToken.tokenId(0x6e6d62)();
}

function trigger5(address payable addr) payable public {
SubC(addr).receiveToken.value(10)();
}

function trigger6(address payable addr) payable public {

address(SubC(addr)).call.value(1000)(abi.encode(bytes4(keccak256("transferToken(uint256, trcToken)")), 10, 0x6e6d62));
}

function trigger7(address addr) payable public {
// sender_tokens[msg.sender][msg.tokenid] += msg.tokenvalue; // ERROR
}

function trigger8(address addr) public payable returns(bytes memory r){
// r = msg.data;
}

function getBalance() view public returns (uint256 r){
r = address(this).balance;
}
}