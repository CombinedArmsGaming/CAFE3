#include "macros.hpp"

// Convenience function to retrieve all respawn arrays for a given location.

SERVER_ONLY;

params [["_location", nil, ["", objNull]]];

private _key = _location;

if (typeName _key isEqualTo "OBJECT") then
{
	_key = [_key] call BIS_fnc_netId;
};

(f_var_respawnLocationsMap getOrDefault [_key, []])