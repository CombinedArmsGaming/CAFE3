#include "macros.hpp"

// Takes a loadout and removes all radios from it.

if (["acre_sys_radio"] call ace_common_fnc_isModLoaded) then 
{
	_this call f_fnc_acre_removeRadiosFromLoadout;
};