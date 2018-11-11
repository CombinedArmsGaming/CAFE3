//	Zeus extensions for CA, by Bubbus.
//
//	Fills the squad category list with category definitions from zeusNpcSpawner config.
//
//	PARAMETERS:
//
//		_listIDC
//			The control ID for the on-screen category list.

if (isDedicated) exitWith {};

params ["_listIDC"];

_units = missionNamespace getVariable "f_zeus_unitsStructure";

{
	_category = _x;

	_name = _category select 0;

	[_listIDC, _name] call f_fnc_addToList;

} forEach _units;
