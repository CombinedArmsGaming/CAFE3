#include "macros.hpp"

#define CACHE f_arr_gravestoneCache
#define VIP_CACHE f_arr_gravestoneCachePriority

params ["_unit", "_killer", "_instigator", "_useEffects"];

LOCAL_ONLY(_unit);

if (isNull _unit) exitWith
{
    DEBUG_PRINT_LOG("[Gravestones] Called addToGravestoneManager but the corpse was a null object.")
};

_shouldCache = _unit getVariable ["f_var_allowGravestone", true] and {(group _unit) getVariable ["f_var_allowGravestone", true]};

if !(_shouldCache) exitWith
{
    DEBUG_FORMAT1_LOG("[Gravestones] Unit %1 is exempt from the gravestone cache, skipping...")
};

_name = name _unit;
_primary = primaryWeapon _unit;
_secondary = secondaryWeapon _unit;

_unit setVariable ["f_var_diedWithPrimary", _primary];
_unit setVariable ["f_var_diedWithSecondary", _secondary];

_obituary = [_unit] call f_fnc_getObituary;

_netId = _unit call BIS_fnc_netId;

_cacheEntry = [time, _netId, _name, _obituary];

if (isPlayer _unit) exitWith
{
    DEBUG_FORMAT1_LOG("[Gravestones] Adding corpse to the priority cache because it was a player: %1",_unit)

    _cacheEntry pushBack true;
	[_cacheEntry, "VIP_CACHE"] call f_fnc_sendUnitToGravestoneCache;
};

_cacheEntry pushBack false;
[_cacheEntry, "CACHE"] call f_fnc_sendUnitToGravestoneCache;
