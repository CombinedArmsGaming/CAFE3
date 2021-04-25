params ["_group"];

[_group] call f_fnc_disableAdvancedAI;

{
    _x disableAI "PATH";
    _x allowFleeing 0;
    _x forceSpeed 0;
    _x setUnitPos "UP";
} forEach (units _group);
