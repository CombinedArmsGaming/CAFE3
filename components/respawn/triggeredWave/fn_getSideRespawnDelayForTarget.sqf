#include "macros.hpp"

params ["_target"];

private _side = switch (toLower typeName _target) do 
{
	case "object": 
	{
		_target getVariable ["f_var_playerSide", side _target]
	};
	case "group":
	{
		side _target
	};
	case "side":
	{
		_target
	};
};

private _sideStr = [_side] call f_fnc_sideToString;
private _sideRespawnDelay = missionNamespace getVariable ["f_var_respawnDelay_" + _sideStr, 0];

_sideRespawnDelay