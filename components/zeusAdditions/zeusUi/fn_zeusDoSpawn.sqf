//	Zeus extensions for CA, by Bubbus.
//
//	Spawns a squad where the zeus camera is aiming, according to the passed-in squad definition.
//	NOTE: This is not a squad definition from f_fnc_zeusSetupUnits - it has been transformed by f_fnc_zeusFillUnits before it reaches here.
//
//	PARAMETERS:
//
//		_def
//			The squad definition to use for spawning the squad.

_camPos = screenToWorld [0.5, 0.5];

params ["_def"];

if (isNil "_def") exitWith {};

_type = _def select 0;

_vcom 		= missionNamespace getVariable ["zeus_spawn_vcom", false];
_guerrilla 	= missionNamespace getVariable ["zeus_spawn_guerrillas", false];
_suppress 	= missionNamespace getVariable ["zeus_spawn_suppress", false];

switch (_type) do
{

	case "inf":
	{
		_units = _def select 1;
		_gear = _def select 2;
		_side = _def select 3;

		[_units, _camPos, _gear, _side, _vcom, _guerrilla, _suppress] remoteExec ["f_fnc_spawnGroupForZeus", 2];
	};

	case "veh":
	{
		_units = _def select 1;
		_veh = _def select 2;
		_gear = _def select 3;
		_side = _def select 4;

		[_units, _camPos, _veh, _gear, _side, _vcom, _suppress] remoteExec ["f_fnc_spawnVehicleGroupForZeus", 2];
	};

};
