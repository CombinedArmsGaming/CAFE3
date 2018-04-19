//	Zeus extensions for CA, by Bubbus.
//	
//	PARAMETERS:
//	
//		_unit
//			A player unit which is intended to be used for zeusing.  Will be granted godmode by default.
//	
//		_spawnMenu
//			If true, gives the unit a spawn-menu for gearscripted squads which appears in the zeus camera mode.
//	

params ["_unit", "_spawnMenu"];

if (!isServer) exitWith {};

[_unit] remoteExec ["ca_fnc_giveUnitGodmode", _unit, true];
[_unit, _spawnMenu] remoteExec ["ca_fnc_zeusDeployment", _unit, true];
