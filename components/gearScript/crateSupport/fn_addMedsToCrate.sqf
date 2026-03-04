#include "..\macros.hpp"

params ["_side", "_crateName", "_amount"];

if !(CRATE_VAR_EXISTS(_side,_crateName)) exitWith
{
    DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: Unable to modify crate %1 for side %2: it hasn't been created (yet).",_crateName,_side)
};


_crateArray = CRATE_VAR_DYNAMIC(_side,_crateName);

_epiAmount = ceil (1/3 * _amount);
_morphineAmount = floor (1/3 * _amount);
_painkillerAmount = floor (1/3 * _amount);

DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Adding %1 epinephrine to crate type %2 for side %3.",_epiAmount,_crateName,_side)
_crateArray pushBack ["ACE_epinephrine", _epiAmount];

DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Adding %1 morphine to crate type %2 for side %3.",_morphineAmount,_crateName,_side)
_crateArray pushBack ["ACE_morphine", _morphineAmount];

DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Adding %1 painkillers to crate type %2 for side %3.",_epiAmount,_crateName,_side)
_crateArray pushBack ["ACE_painkillers", _painkillerAmount];
