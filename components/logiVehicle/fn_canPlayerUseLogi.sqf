/*
	Check if a player is permitted to use a logi vehicle.

	Author: Bubbus

	Passable arguments:
	0: player to test permission upon
	1: vehicle to test permission upon

	Returns
	true iff player is allowed to use the logi vehicle.

*/

#include "macros.hpp"

params ["_player", "_logiVic"];

private _logiType = GET_LOGITYPE(_logiVic);

if (_logiType isEqualTo "") exitWith {false};

private _failedCheck = false;
private _roles = GET_ROLES_DYNAMIC(_logiType);

if (_roles isNotEqualTo []) then
{
	private _playerRole = toLower (_player getVariable ["f_var_assignGear", ""]);
	_failedCheck = !(_playerRole in _roles);
};

if (_failedCheck) exitWith {false};

private _groups = GET_GROUPS_DYNAMIC(_logiType);

if (_groups isNotEqualTo []) then
{
	private _playerGroup = toLower (groupId group _player);
	_failedCheck = !(_playerGroup in _groups);
};

(!_failedCheck)
