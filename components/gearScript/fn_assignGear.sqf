#include "macros.hpp"

if !IS_TRUE(f_var_gearscript_loaded) exitWith
{
    [
        {
            IS_TRUE(f_var_gearscript_loaded)
        },
        f_fnc_assignGear,
        _this
    
    ] call CBA_fnc_waitUntilAndExecute;
};

if (hasInterface and (!local player)) exitWith
{
    // Gearscripting is local to a client, likely the player unit.
    // Wait until player is local, then continue.
    [
        {
            local player
        },
        f_fnc_assignGear,
        _this
    
    ] call CBA_fnc_waitUntilAndExecute;
};


private _typeOfUnit = toLower (_this#0);
private _unit = _this#1;
private _faction = toLower (faction _unit);

if (count _this > 2) then
{
    _faction = toLower (_this select 2);
};

LOCAL_ONLY(_unit);


// ====================================================================================


private _runningAlready = _unit getVariable ["f_var_assignGear_running", false];
private _forceRun = param [3, false];

if (_runningAlready and (!_forceRun)) exitWith
{
    DEBUG_FORMAT1_LOG("[GEARSCRIPT-2]: Exited early because gearscript is running already (Unit %1)",(str _unit))
};

_unit setVariable ["f_var_assignGear_running", true, true];
_unit setVariable ["f_var_assignGear_done", false, true];


// ====================================================================================


// Resilience against misconfigured loadouts.  Only needs to run before the mission is underway.
// Wait until the mission has started before loading out any units.  Prevents the mission failing to load if loadouts contain missing/misconfigured objects.
if ((isPlayer _unit) and (time <= 0)) exitWith
{
    _unit setUnitLoadout [[],[],[],["U_B_CombatUniform_mcam",[]],[],[],"","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];

    [
        // Wait until mission has started, then apply gearscript.
        {
            time > 0
        },
        f_fnc_assignGear,
        [_typeOfUnit, _unit, _faction, true]
    
    ] call CBA_fnc_waitUntilAndExecute;
};


// ====================================================================================


DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: Attempting to apply '%1' loadout for faction '%2'.",_typeOfUnit,_faction)

_unit setVariable ["f_var_assignGear", _typeOfUnit, true];
_unit setVariable ["f_var_assignGear_Faction", _faction, true];


// ====================================================================================


private _gearVariant = [_faction] call f_fnc_factionToSideName;

if (_gearVariant isEqualTo _faction) then
{
    _gearVariant = [_unit] call f_fnc_getUnitConfiguredSide;
};

_unit setVariable ["f_var_assignGear_sideName", _gearVariant, true];

if (_gearVariant == "") exitWith
{
    DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: Exited early because gear variant could not be resolved (Unit %1, Faction %2)",(str _unit),_faction)
};

[_unit, _typeOfUnit, _gearVariant] call f_fnc_applyLoadout;
[_unit, _typeOfUnit, _gearVariant] call f_fnc_applyGunbag;


// ====================================================================================


_unit setVariable ["f_var_assignGear_done", true, true];
_unit setVariable ["f_var_assignGear_running", false, true];


// ====================================================================================


// Send events to components which need to react to gearscripting.
["CAFE_GearscriptAssigned_Local", [_typeOfUnit, _unit, _faction, _gearVariant]] call CBA_fnc_localEvent;
