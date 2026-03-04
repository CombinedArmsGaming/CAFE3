#include "../macros.hpp"

params ["_position", "_object"];

private _onConfirm = 
{
    params ["_values"];

	if (count _values < 1) exitWith {};

	private _toRespawn = _values # 0;

	DEBUG_FORMAT1_LOG("[RESPAWN_ZEN] Got list of players to respawn: %1", _toRespawn);

	{
		systemChat format ["Allowing immediate respawn for %1.", name _x];
    	[] remoteExec ["f_fnc_allowImmediateRespawnLocal", _x];
	} forEach _toRespawn;
};

["Allow immediate respawn", _onConfirm] call f_fnc_selectFromDeadPlayers;
