#include "macros.hpp"

params ["_vic"];

if (isNull _vic) then
{
    systemChat "No Vehicle selected.";
}
else
{
	_vicClass = _vic getVariable "f_var_vicToSpawn";
	_newSpawnAmount = _vic getVariable "f_var_spawnamount";

	if (isNil "_newSpawnAmount") exitWith {systemChat "Non Logi-Vehicle selected."};

	_name = GET_VEHICLE_DISPLAY_NAME(_vicClass);

	["Vehicle Reserves",
    	[
    		["EDIT", format["%1 %2 left, new amount:", _newSpawnAmount, _name]]
    	],
    	{
    		params ["_dialogValues", "_args"];

    		_dialogValues params ["_newSpawnAmount"];
    		_args params ["_vic"];

    		_newSpawnAmount = parseNumber _newSpawnAmount;
    		_vic setVariable["f_var_spawnamount",_newSpawnAmount];
    	},
    	{},
	    [_vic]
    ] call zen_dialog_fnc_create;

};
