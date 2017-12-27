params ["_veh"];

{
	_curator = _x;
	_curator addCuratorEditableObjects [[_veh], true];
	
} forEach allCurators;