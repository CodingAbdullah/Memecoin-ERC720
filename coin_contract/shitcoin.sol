// SPDX-License-Identifier: MIT

pragma solidity >= 0.4.0;

import '../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol'; // Importing the OZ standard interface for ERC-720 tokens

abstract contract Shitcoin is ERC20 {
	uint256 supply = 1000000000000; // A trillion worth of shitcoin ;)
	mapping(address => uint256) holders;
	string _name;
	string _symbol;
	uint8 _decimals;
	address manager;
	address burnWallet;
	mapping(address => mapping(address => uint256)) _allowances; // Nested mapping to keep track of all the allowances

	// ADD EVENTS LATER, fix state variables

	constructor(string memory name_, string memory symbol_) {
		_name = name_;
		_symbol = symbol_;
	}

	function totalSupply() public override view returns(uint256) {
		return supply;
	}

	function balanceOf(address account) public override view returns(uint256){
		return holders[account];
	}

	function transfer(address recipient, uint256 amount) public override view returns(bool) {
		require(address(recipient) != address(0));
		require(amount <= holders[msg.sender]);
		
		holders[recipient] += amount; // Transfer token amount
		holders[msg.sender] -= amount;

		return true;
	}

	function allowance(address owner, address spender) public override view returns(uint256) {
		require(address(owner) != address(0));
		require(address(spender) != address(0));

		return _allowances[spender][owner]; // Return the allowance of spender to owner's token holdngs
	}

	function approve(address spender, uint256 amount) public override view returns(bool) {
		require(address(spender) != address(0));

		_allowances[spender][msg.sender] = amount; // Set the allowance to requested amount
		return true;
	}

	function transferFrom(address sender, address recipient, uint256 amount) public override view returns(bool) {
		require(address(sender) != address(0));
		require(address(recipient) != address(0));
		require(amount <= _allowances[recipient][sender]);

		_allowances[recipient][sender] -= amount;

		address(sender).transfer = amount; // Fix this later 
	}

	function increaseAllowance(address spender, uint256 addedValue) public override view returns(bool) {
		require(address(spender) != address(0));
		
		_allowances[spender][msg.sender] += addedValue; // Increase thr allotted spending
		return true;
	}

	function decreaseAllowance(address spender, uint256 subtractedValue) public override view returns(bool) {
		require(address(spender) != address(0));

		_allowances[spender][msg.sender] -= subtractedValue; // Decrease the allotted spending
	}

	function _transfer(address sender, address recipient, uint256 amount) internal override {
		require(address(sender) != address(0));
		require(address(recipient) != address(0));
		require(sender.balance >= amount);
		 
		// Add more logic with regards usage
	}

	function _mint(address account, uint256 amount) internal override {
		require(amount <= supply); // Make sure the amount being minted is less than or equal to the supply

		account.transfer(amount); // Transfer amount to wallet address
		holders[account] += amount;
		supply -= amount;
	}

	function _burn(address account, uint256 amount) internal override {
		require(amount <= supply); // Check to make sure amount being burned is less than or equal to the actual supply

		account.transfer(amount); // Transfer amount to sink wallet
		supply -= amount;
	}

	function _approve(address owner, address spender, uint256 amount) internal override  {
		require(address(owner) != address(0));
		require(address(spender) != address(0));

		_allowances[spender][owner] = amount; // Approve by setting the allowance of spender of owner's tokens
	}

	function _beforeTokenTransfer(address from, address to, uint256 amount) internal override {
		if ((address(from) != address(0)) && (address(to) != address(0))){
			address(from).balance -= amount;
			address(to).transfer += amount;
		}
		else if (address(from) == address(0)) {
			_mint(to, amount); // Null source address means a mint 
		}
		else if (address(to) == address(0)) {
			_burn(from, amount); // Null destination address (sink) means tokens are sent to a wallet whicch cannot be retrieved. Hence, burned.
		}
	}

	function _afterTokenTransfer(address from, address to, uint256 amount) internal override {
		if ((address(from) != address(0)) && (address(to) != address(0))){
			address(from).balance -= amount;
			address(to).transfer += amount;
		}
		else if (address(from) == address(0)) {
			_mint(to, amount); // Null source address means a mint 
		}
		else if (address(to) == address(0)) {
			_burn(from, amount); // Null destination address (sink) means tokens are sent to a wallet whicch cannot be retrieved. Hence, burned.
		}
	}
}