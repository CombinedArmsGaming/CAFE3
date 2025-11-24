#include "macros.hpp"

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

// Add to bad spawn list if they did not spawn where they selected
private _didFirstSpawn = missionNamespace getVariable ["f_var_notifier_didFirstSpawn", false];
missionNamespace setVariable ["f_var_notifier_didFirstSpawn", true];

if (_didFirstSpawn) exitWith 
{	
	[NOTIFIER_LIST_DEAD_PLAYERS, true] call f_fnc_raiseNotifierEvent;
	// Remove from the long dead list
	[NOTIFIER_LIST_LONG_DEAD, true] call f_fnc_raiseNotifierEvent;
	private _spawnArray = missionNamespace getVariable ["f_var_spawnPickerDialog_selectedSpawn", objNull];
	DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] selectedSpawn was %1", _spawnArray);
    if (_spawnArray isEqualTo objNull) then 
    {
        // Choose an existing respawn point if one was not specified.
        private _spawns = (_newUnit call bis_fnc_getRespawnPositions) + ((_newUnit call bis_fnc_objectSide) call bis_fnc_getRespawnMarkers);

        if (count _spawns > 0) then
        {
            _spawn = _spawns # 0;
            _spawnArray = [_spawn, (_spawn call BIS_fnc_showRespawnMenuPositionName) # 0];
        } else {
			DEBUG_PRINT_LOG("[ZEUS_NOTIFIER] Could not find any spawns!");
		};
    };
    
    if (_spawnArray isNotEqualTo objNull) then 
    {
        _spawnArray params ["_spawnPoint", ["_spawnName", "Unnamed"]];
		private _spawnLocation = [];
		switch (typeName _spawnPoint) do {
			case "ARRAY": {_spawnLocation = _spawnPoint;};
			case "STRING": {_spawnLocation = (getMarkerPos _spawnPoint);};
			case "OBJECT": {_spawnLocation = (getPosATL _spawnPoint);};
    	};

		DEBUG_FORMAT3_LOG("[ZEUS_NOTIFIER] Intended respawn location for player %1 was %2. Their position is %3", name player, _spawnLocation, getPosATL player);
		
		private _playerLocation = getPosATL player;

		// Check if the x and y of the spawn location and the player's location are close enough
		private _sameLocation = true;
		private _tolerance = 1;
		{
			if (abs (_x - (_spawnLocation # _forEachIndex)) > _tolerance) then {
				_sameLocation = false;
				break;
			}
		} forEach [_playerLocation # 0, _playerLocation # 1];

		if (!_sameLocation) then {
			[NOTIFIER_LIST_BAD_SPAWN, false, NOTIFIER_AUTO_REMOVE_TIME] call f_fnc_raiseNotifierEvent;
			DEBUG_PRINT_LOG("[ZEUS_NOTIFIER] Raising event for bad spawn of player %1!!", name player);
		};
    };
};