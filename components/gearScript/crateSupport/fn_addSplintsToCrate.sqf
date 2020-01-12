#include "..\macros.hpp"

params ["_side", "_crateName", "_amount"];

if !(CRATE_VAR_EXISTS(_side,_crateName)) exitWith
{
    DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: Unable to modify crate %1 for side %2: it hasn't been created (yet).",_crateName,_side)
};


_crateArray = CRATE_VAR_DYNAMIC(_side,_crateName);

DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Adding %1 splints to crate type %2 for side %3.",_amount,_crateName,_side)
_crateArray pushBack ["ACE_splint", _amount];
