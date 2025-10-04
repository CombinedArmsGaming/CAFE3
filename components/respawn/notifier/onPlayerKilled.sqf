#define ENABLE_DEBUG
#include "macros.hpp"

params ["_newUnit"];

private _checkDeathTime = {
	params ["_newUnit"];

	

	if (alive _newUnit) exitWith {
		DEBUG_PRINT_LOG("[ZEUS_NOTIFIER] Death time checking loop exiting as player is alive");
	};

	private _deathTime = missionNamespace getVariable ["f_var_playerDeathTime", CBA_missionTime];

	DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Mission time: %1, death time: %2", CBA_missionTime, _deathTime);
	
	if (CBA_missionTime - _deathTime > LONG_TIME_DEAD) exitWith {
		DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Firing long dead event. Mission Time: %1, Death time: %2", CBA_missionTime, _deathTime);
		[
			NOTIFIER_CLIENT_NEW_NOTIF_EVENT,
			[NOTIFIER_LIST_LONG_DEAD # 0, name _newUnit, false]
		] call CBA_fnc_serverEvent;
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