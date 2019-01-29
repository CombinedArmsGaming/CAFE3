#include "macros.hpp"
//	Zeus extensions for CA, by Bubbus.
//
//	PARAMETERS:
//
//		_unit
//			A player unit which is intended to be used for zeusing.
//          Will be granted godmode by default.
//          Will also be subscribed to kill logs.
//

params ["_unit"];

if (typeName _unit == "ARRAY") exitWith
{
	DEBUG_FORMAT2_LOG("[BIG OOF] RegisterZeusPlayer got array unit: _unit = %1, _this = %2",_unit,_this)
};

RUN_LOCAL_TO(_unit,f_fnc_registerZeusPlayer,_this);

[_unit] call f_fnc_giveUnitGodmode;

_unit setVariable ["f_var_isKillLogRecipient", true, true];
_unit setVariable ["f_var_isZeus", true, true];
