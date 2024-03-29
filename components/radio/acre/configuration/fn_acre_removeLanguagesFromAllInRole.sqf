params [["_languages", nil, ["",[]]], ["_side", nil, [west]], ["_role", nil, ["",[]]]];

if (typeName _languages isEqualTo "STRING") then
{
    _languages = [_languages];
};

private _multipleGroups = (typeName _groupName isEqualTo "ARRAY");
private _multipleRoles = ;

if (typeName _role isEqualTo "ARRAY") exitWith
{
    {
        [_languages, _side, _x, _groupName] call f_fnc_acre_removeLanguagesFromAllInRole;
    }
    forEach _role;
};

private _languagesKey = format ["--%1::%2::%3", [_side] call f_fnc_sideToString, RADIOS_SELECTOR_ALL, toUpper _role];

private _languageList = f_map_languageAssignments getOrDefault [_languagesKey, [], true];

{
    _languageList pushBackUnique _x;
} 
forEach _languages;

_languageList