#include "..\macros.hpp"

params ["_group"];

waitUntil {!isNil 'f_var_downtimeDialog_buttonGroup_activity'};
waitUntil {!isNil 'f_var_downtimeDialog_buttonGroup_respawn'};

_groupArray = missionNamespace getVariable [format ["f_var_downtimeDialog_buttonGroup_%1", _group], []];

{
    [_x] call f_fnc_downtimeDialog_setupButton;

} forEach _groupArray;
