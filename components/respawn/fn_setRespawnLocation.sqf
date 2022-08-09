#include "macros.hpp"

// Convenience function to abstract away target unless needed, and also maintain respawn registry.

SERVER_ONLY;

params [["_location", nil, ["", objNull]], ["_name", nil, [""]], ["_target", missionNamespace]];

private _respawnIdArray = [_target, _location, _name] call BIS_fnc_addRespawnPosition;

private _id = _location;
if (typeName _id isEqualTo "OBJECT") then
{
	_id = [_object] call BIS_fnc_netId;
};

([_id, _location] + _respawnIdArray) call f_fnc_addToRespawnLocationsMap;