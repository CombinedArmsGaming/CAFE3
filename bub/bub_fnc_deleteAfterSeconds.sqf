params ["_vehicle", "_group", "_secs"];

if (!isServer) exitWith {};

[_vehicle, _group, _secs] spawn 
{
	params ["_vehicle", "_group", "_secs"];
	
	sleep _secs;
	
	{deleteVehicle _x} forEach (units _group);
	
	deleteVehicle _vehicle;

};