#include "../macros.hpp"

params ["_position", "_object"];

if (!((alive _object) and {isPlayer _object} and {_object isKindOf "CAManBase"})) exitWith 
{
    ["Must use this module upon a player (not dead)."] call zen_common_fnc_showMessage;
};

[_object] remoteExec ["f_fnc_reapplyGear", _object];

["%1 has been given a new set of radios.", name _object] call zen_common_fnc_showMessage;