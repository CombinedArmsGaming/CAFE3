params ["_object", "_isLarge"];

private _isDefused = _object getVariable ["defused", false];
if (_isDefused) exitWith {};

// Add a small amount of height for IED objects that have their origin at floor level.
private _boomPosWorld = (getPosWorld _object) vectorAdd [0,0,0.2];

private _boomArgs = 
[
    ["DemoCharge_Remote_Ammo_Scripted", "SatchelCharge_Remote_Ammo_Scripted"] select _isLarge,
    _boomPosWorld
];

deleteVehicle _object;

// Wait a frame before exploding, to ensure explosion isn't "caught inside" the IED object.
[
    {
        params ["_explosiveClass", "_boomPosWorld"];
        
        private _explosive = _explosiveClass createVehicle [0,0,0];
        _explosive setPosWorld _boomPosWorld;
        _explosive setDamage 1;
    },
    _boomArgs
    
] call CBA_fnc_execNextFrame;