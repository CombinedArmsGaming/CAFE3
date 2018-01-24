if (isDedicated) exitWith {};

params ["_listIDC"];

_units = missionNamespace getVariable "bub_zeus_unitsStructure";

{
	_category = _x;
	
	_name = _category select 0;
	
	[_listIDC, _name] execVM "bub\zeus_ui\displayManip\bub_vm_cl_addToList.sqf";

} forEach _units;