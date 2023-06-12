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

private _sideLanguages = missionNamespace getVariable [format ["f_arr_acre_languages_%1", _sideStr], []];
if (typeName _sideLanguages isEqualTo "STRING") then {_sideLanguages = [_sideLanguages]};

private _languagesList = +_sideLanguages;

{
    private _languagesForKey = f_map_languageAssignments getOrDefault [_x, []];
    
    {
        _languagesList pushBackUnique _x;        
    } 
    forEach _languagesForKey;
} 
foreach _queryStringsAdd;


private _queryStringsRemove = _queryStringsAdd apply {"--" + _x};

{
    private _languagesForKey = f_map_languageAssignments getOrDefault [_x, []];
    
    {
        _languagesList = _languagesList - [_x];        
    } 
    forEach _languagesForKey;
} 
foreach _queryStringsRemove;

_languagesList