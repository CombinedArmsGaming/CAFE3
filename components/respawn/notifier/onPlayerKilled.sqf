#include "macros.hpp"

params ["_newUnit", "_oldUnit"];

[NOTIFIER_LIST_DEAD_PLAYERS] call f_fnc_raiseNotifierEvent;

private _checkDeathTime = {
	params ["_newUnit"];

	if (alive player) exitWith {
		DEBUG_PRINT_LOG("[ZEUS_NOTIFIER] Death time checking loop exiting as player is alive");
	};

	private _deathTime = missionNamespace getVariable ["f_var_playerDeathTime", CBA_missionTime];

	if (CBA_missionTime - _deathTime > LONG_TIME_DEAD) exitWith {
		DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Firing long dead event. Mission Time: %1, Death time: %2", CBA_missionTime, _deathTime);
		[NOTIFIER_LIST_LONG_DEAD] call f_fnc_raiseNotifierEvent;
	};

	[
		{
			params ["_newUnit", "_checkDeathTime"];
			[_newUnit] call _checkDeathTime;
		},
		[_newUnit, _checkDeathTime],
		1
	] call CBA_fnc_waitAndExecute;
};

DEBUG_PRINT_LOG("[ZEUS_NOTIFIER] Player killed! Starting death time loop");
[_newUnit] call _checkDeathTime;