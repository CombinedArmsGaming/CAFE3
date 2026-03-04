// ACRE integration for CAFE, by Bubbus

private _typeOfUnit = player getVariable ["f_var_assignGear", ""];
private _radioConfig = [player, _typeOfUnit] call f_fnc_acre_getRadioConfigForUnit;
[player, _radioConfig] call f_fnc_acre_applyRadioChannelConfig;