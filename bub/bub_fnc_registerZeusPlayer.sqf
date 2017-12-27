params ["_unit"];

if (!isServer) exitWith {};

_unit setVariable ["ace_w_allow_dam",false,true];
_unit addEventHandler ["HandleDamage", {false}];
_unit addCuratorEditableObjects [(vehicles + allUnits), true];
_unit removeCuratorEditableObjects [_unit, true];

[[_unit], "bub\bub_vm_cl_zeusDeployment.sqf"] remoteExec ["execVM", _unit, true];
