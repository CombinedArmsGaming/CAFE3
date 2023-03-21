// ACRE integration for CAFE, by Bubbus

params ["_unit", "_srChannelIndex", "_lrChannelIndex", "_xlrChannelIndex"];

private _hasAnyConfig = (_srChannelIndex >= 0) or {_lrChannelIndex >= 0} or {_xlrChannelIndex >= 0};
if !(_hasAnyConfig) exitWith {};

private _hasSR = [_unit, f_var_acre_standardSHRadio] call acre_api_fnc_hasKindOfRadio;
private _radioSR = if (_hasSR) then {[f_var_acre_standardSHRadio] call acre_api_fnc_getRadioByType} else {""};

private _hasLR = [_unit, f_var_acre_standardLRRadio] call acre_api_fnc_hasKindOfRadio;
private _radioLR = if (_hasLR) then {[f_var_acre_standardLRRadio] call acre_api_fnc_getRadioByType} else {""};

private _hasExtra = [_unit, f_var_acre_extraRadio] call acre_api_fnc_hasKindOfRadio;
private _radioExtra = if (_hasExtra) then {[f_var_acre_extraRadio] call acre_api_fnc_getRadioByType} else {""};

private _hasBackpack = [_unit, f_var_acre_backpackRadio] call acre_api_fnc_hasKindOfRadio;
private _radioBackpack = if (_hasBackpack) then {[f_var_acre_backpackRadio] call acre_api_fnc_getRadioByType} else {""};


if (_hasSR and (_srChannelIndex >= 0)) then
{
    [_radioSR, (_srChannelIndex + 1)] call acre_api_fnc_setRadioChannel;
};

if (_hasLR and (_lrChannelIndex >= 0)) then
{
    [_radioLR, (_lrChannelIndex + 1)] call acre_api_fnc_setRadioChannel;
};

if (_hasExtra and (_xlrChannelIndex >= 0)) then
{
    [_radioExtra, (_xlrChannelIndex + 1)] call acre_api_fnc_setRadioChannel;
};

if (_hasBackpack and (_xlrChannelIndex >= 0)) then
{
    [_radioBackpack, (_xlrChannelIndex + 1)] call acre_api_fnc_setRadioChannel;
};