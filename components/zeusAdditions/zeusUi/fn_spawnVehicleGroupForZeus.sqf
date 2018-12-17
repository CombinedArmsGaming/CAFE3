//	Zeus extensions for CA, by Bubbus.
//
//	f_fnc_spawnvehiclegroup does not add spawned units to zeus so they can't move them around etc.  We fix that here.
//
//	PARAMETERS:
//
//		See parameters for f_fnc_spawnvehiclegroup.

params [
	"_units",
	"_camPos",
	"_veh",
	"_gear",
	"_side",
	["_spawn_vcom", false, [false]],
	["_spawn_suppress", false, [false]]
];

_groupVeh = [_units, _camPos, _veh, _gear, _side] call f_fnc_spawnvehiclegroup;

{
	_group = _groupVeh select 0;
	_vehicle = _groupVeh select 1;

	_units = units _group;
	_units pushBack _vehicle;
	_curator = _x;

	_curator addCuratorEditableObjects [_units, true];

} forEach allCurators;

if (_spawn_vcom) then
{
	_group setVariable ["Vcm_Disable", true, true];
};

if (_spawn_suppress) then
{
	private _group = _groupVeh select 0;
	[_group] call f_fnc_groupSuppressiveAI;
};
