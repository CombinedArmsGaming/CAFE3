#include "macros.hpp"

params ["_side", "_role", "_groupName"];

private _sideStr = [_side] call f_fnc_sideToString;
private _roleStr = toUpper _role;
private _groupStr = toUpper _groupName;

private _queryStringsAdd = 
[
    format ["%1::%2::%3", _sideStr, _groupStr, _roleStr],
    format ["%1::%2::%3", _sideStr, _groupStr, RADIOS_SELECTOR_ALL],
    format ["%1::%2::%3", _sideStr, RADIOS_SELECTOR_ALL, _roleStr],
    format ["%1::%2::%3", _sideStr, RADIOS_SELECTOR_ALL, RADIOS_SELECTOR_ALL]
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