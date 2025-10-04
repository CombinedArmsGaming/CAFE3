#include "macros.hpp"

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

// Remove from the long dead list
[
	NOTIFIER_CLIENT_NEW_NOTIF_EVENT,
	[NOTIFIER_LIST_LONG_DEAD # 0, name _newUnit, true]
] call CBA_fnc_serverEvent;

