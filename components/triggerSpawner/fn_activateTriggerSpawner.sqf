params ["_trigger"];

private _markerName = _trigger getVariable ["f_var_spawnerMarkerName", ""];

if (_markerName isNotEqualTo "") then
{
    _markerName setMarkerColor "ColorRed";
};

private _linkedTo = synchronizedObjects _trigger;
_linkedTo = _linkedTo select {typeOf _x isEqualTo "Logic"};

{
    [_x] call f_fnc_activateTriggerSpawnerNode;
    
} forEach _linkedTo;