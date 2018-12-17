#include "macros.hpp"
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

RUN_LOCAL_TO(_unit,f_fnc_registerZeusPlayer,_this);

[_unit] call f_fnc_giveUnitGodmode;
[_unit, _spawnMenu] call f_fnc_zeusDeployment;
