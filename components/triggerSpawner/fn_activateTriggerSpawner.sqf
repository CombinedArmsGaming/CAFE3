params ["_trigger"];

private _linkedTo = synchronizedObjects _trigger;
_linkedTo = _linkedTo select {_x isKindOf "Logic"};

{
    [_x] call f_fnc_activateTriggerSpawnerNode;
    
} forEach _linkedTo;