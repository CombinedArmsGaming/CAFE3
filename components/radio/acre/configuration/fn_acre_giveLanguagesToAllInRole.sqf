#include "macros.hpp"

params [["_languages", nil, ["",[]]], ["_side", nil, [west]], ["_role", nil, ["",[]]]];

if (_languages isEqualType "") then
{
    _languages = [_languages];
};

if (_role isEqualType []) exitWith
{
    {
        [_languages, _side, _x] call f_fnc_acre_giveLanguagesToAllInRole;
    }
    forEach _role;
};

private _languagesKey = format ["%1::%2::%3", [_side] call f_fnc_sideToString, RADIOS_SELECTOR_ALL, toUpper _role];

private _languageList = f_map_languageAssignments getOrDefault [_languagesKey, [], true];

{
    _languageList pushBackUnique _x;
} 
forEach _languages;

_languageList