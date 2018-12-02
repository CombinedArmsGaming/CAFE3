#include "..\macros.hpp"

params ["_side", "_crateName", "_amount"];

if !(CRATE_VAR_EXISTS(_side,_crateName)) exitWith
{
    DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: Unable to modify crate %1 for side %2: it hasn't been created (yet).",_crateName,_side)
};


_crateArray = CRATE_VAR_DYNAMIC(_side,_crateName);

_elasticsCount = ceil (2/5 * _amount);
_packingCount = floor (2/5 * _amount);
_dressingCount = _amount - (_elasticsCount + _packingCount);

DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Adding %1 elastic bandages to crate type %2 for side %3.",_elasticsCount,_crateName,_side)
_crateArray pushBack ["ACE_elasticBandage", _elasticsCount];

DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Adding %1 packing bandages to crate type %2 for side %3.",_packingCount,_crateName,_side)
_crateArray pushBack ["ACE_packingBandage", _packingCount];

DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Adding %1 field dressings to crate type %2 for side %3.",_dressingCount,_crateName,_side)
_crateArray pushBack ["ACE_fieldDressing", _dressingCount];
