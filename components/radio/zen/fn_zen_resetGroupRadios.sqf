#include "../macros.hpp"

params ["_position", "_object"];

if (!alive _object) exitWith 
{
    ["Must use this module upon a unit (not dead)."] call zen_common_fnc_showMessage;
};

private _players = units group _object;
_players = _players select {(alive _x) and {isPlayer _x} and {_x isKindOf "CAManBase"}};

{
    [_x] remoteExec ["f_fnc_reapplyGear", _x];
}
foreach _players;

["All group members have been given new radios."] call zen_common_fnc_showMessage;