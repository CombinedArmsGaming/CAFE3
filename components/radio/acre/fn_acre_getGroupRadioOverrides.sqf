// ACRE integration for CAFE, by Bubbus

params ["_group", "_existingConfig"];

private _groupId = groupId _group;
private _sideName = [side _group] call f_fnc_sideToString;

private _configOut = [];

{
	private _channelOverrideKey = format ["f_var_acre_groupRadio::%1::%2::%3", _sideName, _groupId, _x#0];
	private _newConfig = missionNamespace getVariable [_channelOverrideKey, _x];
	_configOut pushBack _newConfig;

} foreach _existingConfig;

_configOut