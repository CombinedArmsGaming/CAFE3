#include "macros.hpp"

// Re-check existence of spawnpoint in case state has changed outwith the respawn manager's remit.

params ["_state", "_spawnpointData", "_target", "_location"];

private _return = "";

// BI's respawn system does some tricks to store object locations/side targets.  Sort that out.
private _varName = "BIS_fnc_getRespawnPositions_list";
private _targetDataHolder = _target;
if ((typeName _target) isEqualTo "SIDE") then
{
	_varName = _varName + str _target;
	_targetDataHolder = missionNamespace;
};

private _locationData = switch (typeName _location) do 
{
	case "OBJECT": { _location call BIS_fnc_objectVar };
	default { _location };
};

private _targetRespawns = _targetDataHolder getVariable [_varName, [-1,[],[],[],[]]];


// Check if spawnpoint has been created, and adopt it if so.
if (_spawnpointData isEqualTo []) then
{
	private _locationIndex = (_targetRespawns#2) findIf {_x isEqualTo _locationData};

	if (_locationIndex >= 0) then
	{
		DEBUG_FORMAT2_LOG("[RESPAWN] Adopting spawnpoint [%1; %2]",_target,_locationData)

		private _locationIdentifier = _targetRespawns#1#_locationIndex;
		private _newSpawnpointData = [_target, _locationIdentifier];

		_state set [0, true];
		_state set [1, _newSpawnpointData];
		_return = "added";
	};
}
// Check if spawnpoint has been deleted, and update state if so.
else
{
	private _locationIdentifier = _spawnpointData#1;
	private _locationIndex = (_targetRespawns#1) findIf {_x isEqualTo _locationIdentifier};

	if (_locationIndex < 0) then
	{
		DEBUG_FORMAT2_LOG("[RESPAWN] Spawnpoint has been removed - untracking spawnpoint [%1; %2]",_target,_locationData)

		_state set [0, false];
		_state set [1, []];
		_return = "removed";
	};
};

_return