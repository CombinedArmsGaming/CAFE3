if (!isServer) exitWith {};

[] spawn
{
	missionNamespace setVariable ["bub_timeTravelled", 1];

	[[], "bub\bub_vm_cl_applyTimeTravelFx.sqf"] remoteExec ["execVM", 0];

	sleep 0.25;

	setDate [1940, 8, 12, 12, 32];

	0 setRain 0;
	0 setLightnings 0;
	setWind [2, 1, true];
	0 setGusts 0.1;
	0 setWaves 0.5;
		
	forceWeatherChange;
	
	{ _x enableAI "ALL"; } forEach allUnits;
	
	_toDelete = missionNamespace getVariable ["toDelete", []];	
	{ deleteVehicle _x; } forEach _toDelete;
	carrier call BIS_fnc_Carrier01EdenDelete;
	
	_toShow = missionNamespace getVariable ["toShow", []];	
	{ _x setPos ((getPos _x) vectorAdd [0,0,100]); } forEach _toShow;
	
	for [{_i=1}, {_i <= 8}, {_i = _i+1}] do
	{
		_grpVeh = [["smg","ar","rif","rif","rif","rif"],"evac_" + str _i,"evac_goto","LIB_LCVP","ind_f",independent] call ca_fnc_spawnvehicleattack;
		
		_group = _grpVeh select 0;
		_vehicle = _grpVeh select 1;
		
		(leader _group) moveInDriver _vehicle;
		
		{ if !(leader _group == _x) then {_x moveInCargo _vehicle;}; } forEach (units _group);
		{ if !(driver _vehicle == _x) then { _x disableAI "ALL"; }; } forEach (units _group);
		
		[_vehicle, _group, 360] call bub_fnc_deleteAfterSeconds;
		
		sleep 0.25;
	};
	
}



