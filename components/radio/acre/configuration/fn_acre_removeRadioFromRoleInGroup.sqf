params ["_radio", "_side", "_role", "_groupName"];

private _radioKey = format ["--%1::%2::%3", [_side] call f_fnc_sideToString, toUpper _groupName, toUpper _role];

private _radiosList = f_map_radioAssignments getOrDefault [_radioKey, [], true];

_radiosList pushBack _radio;