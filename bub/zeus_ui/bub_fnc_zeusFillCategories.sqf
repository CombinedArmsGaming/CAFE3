if (isDedicated) exitWith {};

params ["_list"];

_units = missionNamespace getVariable "bub_zeus_unitsStructure";

{
	_category = _x;
	
	_name = _category select 0;
	
	_list lbAdd _name;

} forEach _units;