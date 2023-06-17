#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_assignGear);

// ====================================================================================

_unit = _this select 1;
_typeOfUnit = toLower (_this select 0);
_faction = toLower (faction _unit);

if (count _this > 2) then
{
    _faction = toLower (_this select 2);
};

if (IS_PLAYER) then
{
    waitUntil {local player};
};

LOCAL_ONLY(_unit);

DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Entered gearscript for unit %1 (%2, %3).",(str _unit),_typeOfUnit,_faction)

// ====================================================================================

if !IS_TRUE(f_var_gearscript_loaded) then
{
    waitUntil { IS_TRUE(f_var_gearscript_loaded) };
};

isNil 
{
    _runningAlready = _unit getVariable ["f_var_assignGear_running",false];
    if (_runningAlready) exitWith
    {
        DEBUG_FORMAT1_LOG("[GEARSCRIPT-2]: Exited early because gearscript is running already (Unit %1)",(str _unit))
    };

    _unit setVariable ["f_var_assignGear_running", true, true];
    _unit setVariable ["f_var_assignGear_done", false, true];
};

// ====================================================================================

// Resilience against misconfigured loadouts.  Only needs to run before the mission is underway.
if (time <= 1) then
{
    // Immediately set the loadout to a completely blank loadout if the unit is a player.  Prevents an awkward moment where the player is holding default gear.
    if (isPlayer _unit) exitWith
    {   
        // Respawn compat - ensure these variables are set *immediately* so they can be picked up by the respawn template.
        _unit setVariable ["f_var_assignGear", _typeOfUnit, true];
        _unit setVariable ["f_var_assignGear_Faction", _faction, true];

        _unit setUnitLoadout [[],[],[],["U_B_CombatUniform_mcam",[]],[],[],"","",[],["ItemMap","","","ItemCompass","ItemWatch",""]];

        // In this scenario, player gearscripting gets taken over by the respawn template "CAFE_Loadout".  Just exit here.    
        _unit setVariable ["f_var_assignGear_done", true, true];
        _unit setVariable ["f_var_assignGear_running", false, true];
    };
    
    // If not a player, it isn't as critical that the loadout is applied ASAP.
    waitUntil { sleep 3; time > 0 };

};

// ====================================================================================

DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: Attempting to apply '%1' loadout for faction '%2'.",_typeOfUnit,_faction)

_unit setVariable ["f_var_assignGear", _typeOfUnit, true];
_unit setVariable ["f_var_assignGear_Faction", _faction, true];

// ====================================================================================

_gearVariant = [_faction] call f_fnc_factionToSideName;

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

if (isPlayer _unit) then
{
    [_unit] spawn f_fnc_addInsigniaMonitor;
}
else
{
    #ifdef ENABLE_IDENTITY_REPLACEMENT

	if (_unit isKindOf "CAManBase") then
	{
	    [_unit, _gearVariant] call f_fnc_applyFactionIdentity;
	};

    #endif
};
