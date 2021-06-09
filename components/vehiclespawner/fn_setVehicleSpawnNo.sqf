#include "macros.hpp"


params ["_vic"];


if (isNull _vic) then
{
    systemChat "No Vehicle selected.";
}
else
{
	_vicClass = _vic getVariable "f_var_vicToSpawn";
	_newspawnamount = _vic getVariable "f_var_spawnamount";

	if(isNil "_newspawnamount") exitWith {systemChat "Non Logi-Vehicle selected."};

	_name = (getText(configFile >> "CfgVehicles" >> _vicClass >> "displayName"));

	["Vehicle Reserves",
	[
		["EDIT", format["%1 %2 left, new amount:",_newspawnamount, _name]]
	],
	{
		params ["_dialogValues", "_args"];
		_dialogValues params ["_newspawnamount"];
		_args params ["_vic"];

		_newspawnamount = parseNumber _newspawnamount;
		_vic setVariable["f_var_spawnamount",_newspawnamount];

	},
	{},
	[_vic]] call zen_dialog_fnc_create;

};