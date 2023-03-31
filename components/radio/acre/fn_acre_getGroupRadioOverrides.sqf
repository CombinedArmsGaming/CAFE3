// ACRE integration for CAFE, by Bubbus

params ["_group", "_existingConfig"];

private _groupId = groupId _group;
private _sideName = [side _group] call f_fnc_sideToString;

private _configOut = [];

{
	private _channelOverrideKey = format ["f_var_acre_groupRadio::%1::%2::%3", _sideName, _groupId, _x#0];
	private _newChannel = missionNamespace getVariable [_channelOverrideKey, _x#1];
	_configOut pushBack [_x#0, _newChannel];

} foreach _existingConfig;

_configOut