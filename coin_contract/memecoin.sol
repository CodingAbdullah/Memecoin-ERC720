// SPDX-License-Identifier: MIT

pragma solidity >= 0.4.0;

// Fix transfer and transfer-from methods

abstract contract Memecoin {
	uint256 internal supply = 1000000000000; // A trillion worth of shitcoin ;)
	mapping(address => uint256) internal holders;
	string internal _name;
	string internal _symbol;
	uint8 internal _decimals;
	mapping(address => mapping(address => uint256)) internal _allowances; // Nested mapping to keep track of all the allowances

	constructor(string memory name_, string memory symbol_) {
		_name = name_;
		_symbol = symbol_;
	}

	function getName() public view returns(string memory) {
		return _name;
	}

	function totalSupply() public view returns(uint256) {
		return supply;
	}

	function decimals() public view returns (uint8) {
  		return 16;
	}

	function balanceOf(address account) public view returns(uint256) {
		return holders[account];
	}

	function transfer(address recipient, uint256 amount) public  view returns(bool) {
		require(address(recipient) != address(0));
		require(amount <= holders[msg.sender]);
		
		holders[recipient] += amount; // Transfer token amount
		holders[msg.sender] -= amount;

		return true;
	}

	function allowance(address owner, address spender) public view returns(uint256) {
		require(address(owner) != address(0));
		require(address(spender) != address(0));

		return _allowances[spender][owner]; // Return the allowance of spender to owner's token holdngs
	}

	function approve(address spender, uint256 amount) public view returns(bool) {
		require(address(spender) != address(0));

		_allowances[spender][msg.sender] = amount; // Set the allowance to requested amount
		return true;
	}

	function transferFrom(address sender, address recipient, uint256 amount) public view returns(bool) {
		require(address(sender) != address(0));
		require(address(recipient) != address(0));
		require(amount <= _allowances[recipient][sender]);

		_allowances[recipient][sender] -= amount;

		holders[sender] += amount; // Fix this later 
		holders[recipient] -= amount;
	}

	function increaseAllowance(address spender, uint256 addedValue) public view returns(bool) {
		require(address(spender) != address(0));
		
		_allowances[spender][msg.sender] += addedValue; // Increase the allotted spending
		return true;
	}

	function decreaseAllowance(address spender, uint256 subtractedValue) public view returns(bool) {
		require(address(spender) != address(0));

		_allowances[spender][msg.sender] -= subtractedValue; // Decrease the allotted spending
	}

	function _transfer(address sender, address recipient, uint256 amount) internal {
		require(address(sender) != address(0));
		require(address(recipient) != address(0));
		require(sender.balance >= amount);
		 
		// Will add more as use cases become more apparent
	}

	function _mint(address account, uint256 amount) internal {
		require(amount <= supply); // Make sure the amount being minted is less than or equal to the supply

		holders[account] += amount; // Transfer amount to wallet address
		supply -= amount;
	}

	function _burn(address account, uint256 amount) internal {
		require(amount <= supply); // Check to make sure amount being burned is less than or equal to the actual supply

		account.transfer(amount); // Transfer amount to sink wallet (fix this)
		supply -= amount;
	}

	function _approve(address owner, address spender, uint256 amount) internal  {
		require(address(owner) != address(0));
		require(address(spender) != address(0));

		_allowances[spender][owner] = amount; // Approve by setting the allowance of spender of owner's tokens
	}

	function _beforeTokenTransfer(address from, address to, uint256 amount) internal {
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

	function _afterTokenTransfer(address from, address to, uint256 amount) internal {
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