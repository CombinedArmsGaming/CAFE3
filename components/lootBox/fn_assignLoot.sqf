#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_assignLoot);

params ["_container", "_loot"];

LOCAL_ONLY(_container);

waitUntil { IS_TRUE(f_var_lootbox_loaded) };

_runningAlready = _container getVariable ["f_var_assignLoot_running",false];
if (_runningAlready) exitWith {};

_container setVariable ["f_var_assignLoot_running",true];
_container setVariable ["f_var_assignLoot_done",false,true];

_container setVariable ["f_var_assignLoot", _loot, true];

[_container, _loot] call f_fnc_applyLoot;

_container setVariable ["f_var_assignLoot_done",true,true];
_container setVariable ["f_var_assignLoot_running",false];
