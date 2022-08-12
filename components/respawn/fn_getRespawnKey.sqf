// Gets a unique key for a spawn location/target combo.

params ["_location", "_target"];

private _locationId = switch (typeName _location) do 
{
	case "OBJECT";
	case "GROUP": {_location call BIS_fnc_netId};
	case "STRING": {_location};
	default {str _location};
};

private _targetId = switch (typeName _target) do 
{
	case "OBJECT";
	case "GROUP": {_target call BIS_fnc_netId};
	case "STRING": {_target};
	default {str _target};
};

(format ["%1@%2", _locationId, _targetId])