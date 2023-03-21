#include "macros.hpp"

params ["_side", "_role", "_groupName"];

private _sideStr = [_side] call f_fnc_sideToString;
private _roleStr = toUpper _role;

private _queryStringsAdd = 
[
    format ["%1::%2::%3", _sideStr, toUpper _groupName, _roleStr],
    format ["%1::%2::%3", _sideStr, ALL, _roleStr],
    format ["%1::%2::%3", _sideStr, ALL, ALL]
];

private _radioList = [];

{
    private _radiosForKey = f_map_radioAssignments getOrDefault [_x, []];
    
    {
        _radioList pushBackUnique _x;        
    } forEach _radiosForKey;

} foreach _queryStringsAdd;


private _queryStringsRemove = _queryStringsAdd apply {"--" + _x};

{
    private _radiosForKey = f_map_radioAssignments getOrDefault [_x, []];
    
    {
        _radioList = _radioList - [_x];        
    } forEach _radiosForKey;

} foreach _queryStringsRemove;

_radioList