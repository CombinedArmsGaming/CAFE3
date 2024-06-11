#include "macros.hpp"

// ACRE integration for CAFE, by Bubbus
// Handler for CA_PreGearscriptUnit_Local event - redirects to appropriate radio mod or halts early on no radio mod.

params [["_typeOfUnit", ""], "_unit", "_faction", "_loadout", "_extendedArray"];

LOCAL_ONLY(_unit);

if (_typeOfUnit isEqualTo "") then
{
	_typeOfUnit = _unit getVariable ["f_var_assignGear", ""];
};

if (_typeOfUnit isEqualTo "") then
{
	throw "Unit provided to f_fnc_configureUnitRadios is not a gearscripted unit.";
};

if (["acre_sys_radio"] call ace_common_fnc_isModLoaded) then 
{
	_this call f_fnc_acre_configureUnitRadios;
};

if ((time > 10) and {hasInterface and {_unit isEqualTo player}}) then
{
	["Your radio configuration has been changed."] call f_fnc_createSubtitleText;
};