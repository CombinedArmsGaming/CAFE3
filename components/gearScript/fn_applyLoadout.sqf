#include "macros.hpp"

params ["_unit", "_typeofUnit", "_gearVariant"];

LOCAL_ONLY(_unit);


_loadoutVarName = format ["f_loadouts_%1_%2", toLower _gearVariant, toLower _typeofUnit];
_loadoutVariants = missionNamespace getVariable [_loadoutVarName, []];


if (_loadoutVariants isEqualTo []) then
{
    DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: No '%1' loadouts found for side '%2' - attempting to use default...",_typeofUnit,_gearVariant)
    _typeofUnit = "default";

    _loadoutVarName = format ["f_loadouts_%1_%2", toLower _gearVariant, toLower _typeofUnit];
    _loadoutVariants = missionNamespace getVariable [_loadoutVarName, []];
    
};


if (_loadoutVariants isEqualTo []) exitWith
{
    DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: No '%1' loadouts found for side '%2' - aborting loadout.",_typeofUnit,_gearVariant)
};


_loadout = selectRandom _loadoutVariants;


if (count HATS_DYNAMIC(_gearVariant,_typeofUnit) > 0) then
{
    _hat = selectRandom HATS_DYNAMIC(_gearVariant,_typeofUnit);

    DEBUG_FORMAT1_LOG("Selected variant hat: %1",_hat)

    _loadout set [6, _hat];
};


if (count VESTS_DYNAMIC(_gearVariant,_typeofUnit) > 0) then
{
    _vest = selectRandom VESTS_DYNAMIC(_gearVariant,_typeofUnit);

    DEBUG_FORMAT1_LOG("Selected variant vest: %1",_vest)

    _loadout select 4 set [0, _vest];
};


if (count UNIFORMS_DYNAMIC(_gearVariant,_typeofUnit) > 0) then
{
    _uniform = selectRandom UNIFORMS_DYNAMIC(_gearVariant,_typeofUnit);

    DEBUG_FORMAT1_LOG("Selected variant uniform: %1",_uniform)

    _loadout select 3 set [0, _uniform];
};


if (count BACKPACKS_DYNAMIC(_gearVariant,_typeofUnit) > 0) then
{
    _backpack = selectRandom BACKPACKS_DYNAMIC(_gearVariant,_typeofUnit);

    DEBUG_FORMAT1_LOG("Selected variant backpack: %1",_backpack)

    _loadout select 5 set [0, _backpack];
};


if (isPlayer _unit) then
{
    _goggles = goggles _unit;

    _loadout set [7, _goggles];
};


DEBUG_FORMAT1_LOG("Final loadout: %1",_loadout)

_unit setUnitLoadout _loadout;
