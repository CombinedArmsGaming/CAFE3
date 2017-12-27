params ["_group"];

{
	_units = units _group;
	_curator = _x;
	_curator addCuratorEditableObjects [_units, true];
	
} forEach allCurators;