#include "macros.hpp"

/*
    CAFE Loadout on-respawn script.

    Make sure the player receives a gearscripted loadout upon respawn.
*/

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

private _loadout = _newUnit getVariable ["f_var_assignGear", "default"];
private _faction = _newUnit getVariable ["f_var_assignGear_Faction", nil];

if ((_loadout isEqualTo "default") and {!isNull _oldUnit}) then
{
    _loadout = _oldUnit getVariable ["f_var_assignGear", "default"];
    _faction = _oldUnit getVariable ["f_var_assignGear_Faction", nil];
};

if !(isNil "_faction") then
{
    DEBUG_FORMAT3_CHAT("[RESPAWN-2]: Applying loadout %1 with faction %2 to %3", _loadout, _faction, _newUnit)
    
    waitUntil
    {
        !(_newUnit getVariable ["f_var_assignGear_running", false])
    };

    [_loadout, _newUnit, _faction] call f_fnc_assignGear;
};

