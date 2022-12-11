params ["_playerUnit", ["_fallbackDelay", 0, [0]]];

private _respawnVariableName = "f_var_respawnDelay_" + (playerSide call f_fnc_sideToString);

missionNamespace getVariable [_respawnVariableName, _fallbackDelay];