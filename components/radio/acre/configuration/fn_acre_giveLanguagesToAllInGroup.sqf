#include "macros.hpp"

params [["_languages", nil, ["",[]]], ["_side", nil, [west]], ["_groupName", nil, ["",[]]]];

if (_languages isEqualType "") then
{
    _languages = [_languages];
};

if (_groupName isEqualType []) exitWith
{
    {
        [_languages, _side, _role, _x] call f_fnc_acre_giveLanguagesToAllInGroup;
    }
    forEach _groupName;
};

private _languagesKey = format ["%1::%2::%3", [_side] call f_fnc_sideToString, toUpper _groupName, RADIOS_SELECTOR_ALL];

private _languageList = f_map_languageAssignments getOrDefault [_languagesKey, [], true];

{
    _languageList pushBackUnique _x;
} 
forEach _languages;

_languageList