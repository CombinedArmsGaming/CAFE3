params ["_trigger"];

if (_trigger getVariable ["f_var_hasShowHide", ""] isNotEqualTo "") exitWith {};

if (vehicleVarName _trigger isEqualTo "") then
{
    _trigger setVariable ["f_var_hasShowHide", "invalid", true];
    throw format ["[Trigger Spawner] Trigger must have a 'Variable Name' if a 'Show/Hide' module is synced to it."];
};

private _linkedTo = synchronizedObjects _trigger;
_linkedTo = _linkedTo select {typeOf _x isEqualTo "ModuleShowHide_F"};

private _amountLinked = count _linkedTo;

if (_amountLinked > 1) then
{
    throw format ["[Trigger Spawner] Trigger '%1' must have only one 'Show/Hide' module synced to it."];
};

if (_amountLinked isEqualTo 0) exitWith
{
    _trigger setVariable ["f_var_hasShowHide", false, true];
};

_trigger setVariable ["f_var_hasShowHide", true, true];
private _module = _linkedTo # 0;

// Below taken from BI fn_moduleShowHide.  Just in case someone changes the "Hide" setting in the module and expects it to work.
private _show = _module getVariable ["state","0"];
if (_show isEqualType "") then { _show = parseNumber _show; };
_show = _show > 0;

if (_show) then
{
    [_trigger] call f_fnc_assignTriggerSpawnerMarker;
};