#include "macros.hpp"

// Checks each currently registered spawn point against its "isCreatedWhen" and "isRemovedWhen" poll functions.
// Automatically adopts spawnpoints created externally which match the _respawnParams.
// Prunes spawnpoint registrations when permanently removed via "isRemovedWhen" or when target / location is deleted.


// Keys to remove after manager run.
private _keysToRemove = [];


// Main manager body - handles state drift and polling.
{
	_x params ["_key", "_respawnParams", "_pollerArray", "_state"];
	_respawnParams params ["_target", "_location", "_name"];
	_pollerArray params ["_isCreatedWhen", "_isRemovedWhen", "_isRepeatable"];

	DEBUG_FORMAT1_LOG("[RESPAWN] Visiting spawn key %1.",_key)


	// Preamble: check if target/location have disappeared or if spawnpoint state has changed outwith the manager.

	if ((_target != _target) or {(typeName _location isNotEqualTo "ARRAY") and {_location != _location}}) then // "Non-failing" null check, needed due to mixed types.
	{
		DEBUG_FORMAT1_LOG("[RESPAWN] Target or location has disappeared for respawn - deregistering key %1",_key)
		_keystoRemove pushBack _key;
		continue;
	};

	private _updateResult = [_state, _state#1, _target, _location] call f_fnc_updateManagedSpawnpoint;
	if ((_updateResult isEqualTo "removed") and (!_isRepeatable)) then
	{
		DEBUG_FORMAT1_LOG("[RESPAWN] Update result was removal and IsRepeatable is false - deregistering key %1",_key)
		_keysToRemove pushBack _key;
		continue;
	};


	// Check poll functions for managed creation/removal.

	_state params ["_isCreated", "_spawnpointData"];

	if (_isCreated and {[] call _isRemovedWhen}) then
	{
		DEBUG_FORMAT2_LOG("[RESPAWN] IsRemovedWhen returned true - removing spawnpoint [%1; %2]",_target,_location)

		_spawnpointData call BIS_fnc_removeRespawnPosition;
		_state set [0, false];
		_state set [1, []];

		if !(_isRepeatable) then
		{
			DEBUG_FORMAT1_LOG("[RESPAWN] IsRepeatable is false - deregistering key %1",_key)
			_keysToRemove pushBack _key;
		};
	};
	
	if ((!_isCreated) and {[] call _isCreatedWhen}) then
	{
		DEBUG_FORMAT2_LOG("[RESPAWN] IsCreatedWhen returned true - creating spawnpoint [%1; %2]",_target,_location)
		private _spawnpointData = _respawnParams call BIS_fnc_addRespawnPosition;
		
		_state set [0, true];
		_state set [1, _spawnpointData];
	};
	
} forEach (values f_var_respawnPollersMap);


// Clean up entries for targets/locations which have been deleted.
{
	// Attempt to remove the underlying spawnpoint first, in case it's still tracked by the BI system.
	private _mapEntry = f_var_respawnPollersMap get _x;
	private _spawnpointData = _mapEntry#3#1;
	if (_spawnpointData isNotEqualTo []) then
	{
		private _target = _spawnpointData#0;
		if (_target == _target) then  // BI function will do the wrong thing if target is null (due to _targetOrig default value).
		{
			_spawnpointData call BIS_fnc_removeRespawnPosition;
		};
	};

	f_var_respawnPollersMap deleteAt _x;	
} forEach _keysToRemove;


// Schedule manager to run every second - too much processing here for per-frame.
[
	f_fnc_respawnManagerLoop,
	[],
	1
] call CBA_fnc_waitAndExecute;

