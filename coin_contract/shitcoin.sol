// SPDX-License-Identifier: MIT

pragma solidity >= 0.4.0;

contract Shitcoin {

	address manager;
	int contributorsCount = 0;

	struct Request {
		int approvalCount;
		string description;
		mapping(address => bool) approvals;
		address recipient;
		int value;
		bool isComplete;
	}

	mapping(address => bool) contributors;
	uint minimumContribution;
	Request[] requests;
	
	constructor(uint contribution) {
		manager = msg.sender;

		require(contribution > 0);
		minimumContribution = contribution;
	}

	modifier restricted {
		require(msg.sender == manager);
		_;
	}

	function contribute() external payable {
		require(msg.value > minimumContribution);
		contributorsCount++;
		contributors[msg.sender] = true;
	}

	function createRequest(string memory description, address recipient, int value) external {
		mapping(address => bool) approvalMap;

		Request memory newRequest = Request(
			0,
			description,
			approvalMap,
			recipient,
			value,
			false
		);

		requests.push(newRequest);
	}

	function approveRequest(int index) external restricted {
		require(contributors[msg.sender]);
		require(!requests[index].approvals[msg.sender]);

		requests[index].approvalCount++;
		requests[index].approvals[msg.sender] = true;
	}

	function finalizeRequest(int index) external restricted {
		if (requests[index]){
			requests[index].isComplete = true;
		}

	}
}
