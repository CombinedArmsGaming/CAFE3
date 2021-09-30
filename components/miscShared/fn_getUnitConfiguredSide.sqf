
params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {""};

private _unitType = typeOf _unit;
private _sideEnum = getNumber (configfile >> "CfgVehicles" >> _unitType >> "side");
private _sideName = (f_arr_supportedSideEnumNames # _sideEnum);

_sideName
