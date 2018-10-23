#include "macros.hpp"

params ["_unit", "_typeofUnit", "_gearVariant"];

LOCAL_ONLY(_unit);


_loadoutVarName = format ["f_loadouts_%1_%2", toLower _gearVariant, toLower _typeofUnit];

_loadoutVariants = missionNamespace getVariable [_loadoutVarName, []];


if (_loadoutVariants isEqualTo []) exitWith
{
    DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: No '%1' loadouts found for side '%2' - aborting loadout.",_typeofUnit,_gearVariant)
};


_randomLoadout = selectRandom _loadoutVariants;

_unit setUnitLoadout _randomLoadout;
