#include "macros.hpp"

#define CACHE f_arr_gravestoneCache
#define VIP_CACHE f_arr_gravestoneCachePriority

params ["_unit", "_killer", "_instigator", "_useEffects"];


if (isNull _unit) exitWith
{
    DEBUG_PRINT_LOG("[Gravestones] Called addToGravestoneManager but the corpse was a null object.")
};

_name = name _unit;
_primary = primaryWeapon _unit;
_secondary = secondaryWeapon _unit;

_unit setVariable ["f_var_diedWithPrimary", _primary];
_unit setVariable ["f_var_diedWithSecondary", _secondary];

_cacheEntry = [time, _unit, _name];

if (isPlayer _unit) exitWith
{
    DEBUG_FORMAT1_LOG("[Gravestones] Adding corpse to the priority cache because it was a player: %1",_unit);
    VIP_CACHE pushBack _cacheEntry;
};

DEBUG_FORMAT1_LOG("[Gravestones] Adding corpse to the regular cache: %1",_unit);

CACHE pushBack _cacheEntry;
