// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Token
{
///////////
// ERC20 //
///////////

	string name = "Only Coin";

	string symbol = "ONLY";

	uint256 decimals = 18;

	uint256 totalSupply = 1000000000000000000;

	mapping
	(
		address => uint256
	)
	public balanceOf;

	mapping 
	(
		address => mapping
		(
			address => uint256
		)
	)
	public allowance;

	function transfer
	(
		address _to,
		uint256 _amount
	)
	public
	{
        _transfer(msg.sender, _to, _amount);
	}

	function transferFrom
	(
		address _from,
		address _to,
		uint256 _amount
	)
	public
	{
		require(_amount <= allowance[_from][msg.sender]);
		_transfer(_from, _to, _amount);
	}

	function _transfer
	(
		address _from,
		address _to,
		uint256 _amount
	)
	internal
	{
        require(from != address(0));
        require(to != address(0));
        require(_amount <= balanceOf[_from]);
        balanceOf[_from] -= _amount;
        balanceOf[_to] -= _amount;
	}

	function approve
	(
		address _spender,
		uint256 _amount
	)
	public
	{
		require(_owner != address(0));
		require(_spender != address(0));
		allowance[msg.sender][_spender] = _amount;
	}

	function mint
	(
		uint256 _amount,
		address _investor
	) 
	public 
	{
		if (msg.sender != fundManagerContract)
		{
			return;
		}
		balanceOf[_investor] += _amount;
		totalSupply += _amount;
	}

	function burn
	(
		uint256 _amount,
		address _outvestor
	) 
	public 
	{
		if (msg.sender != fundManagerContract)
		{
			return;
		}
		balanceOf[_outvestor] -= _amount;
		totalSupply -= _amount;
	}
}
