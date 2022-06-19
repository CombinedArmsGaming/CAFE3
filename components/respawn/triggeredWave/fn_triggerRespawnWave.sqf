#include "macros.hpp"

params ["_target", "_isFree"];

private _respawnTimestamp = CBA_missionTime + RESPAWN_WAVE_DURATION;
private _targetName = "";

if (_isFree) then
{
	[] remoteExec ["f_fnc_addFreeTicket", _target];
};

switch (toLower typeName _target) do 
{
	case "object":
	{
		_target setVariable ["f_var_respawnTimestamp", _respawnTimestamp, true];
		_targetName = name _target;
	};
	case "group": 
	{
		_target setVariable ["f_var_respawnTimestamp", _respawnTimestamp, true];
		_targetName = groupId _target;
	};
	case "side": 
	{
		private _sideStr = [_target] call f_fnc_sideToString;
		missionNamespace setVariable ["f_var_respawnTimestamp_" + _sideStr, _respawnTimestamp, true];
		_targetName = toUpper _sideStr;
	};
};


private _timeStr = [RESPAWN_WAVE_DURATION] call f_fnc_formatTimeDuration;
private _notifyString = format ["Respawn wave called for %1 (for the next %2)!", _targetName, _timeStr];

[_notifyString] remoteExecCall ["systemChat", _target];