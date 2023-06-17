params [["_languages", nil, ["",[]]], ["_side", nil, [west]], ["_role", nil, ["",[]]], ["_groupName", nil, ["",[]]]];

if (typeName _languages isEqualTo "STRING") then
{
    _languages = [_languages];
};

private _multipleGroups = (typeName _groupName isEqualTo "ARRAY");
private _multipleRoles = (typeName _role isEqualTo "ARRAY");

if (_multipleGroups) exitWith
{
    {
        [_languages, _side, _role, _x] call f_fnc_acre_removeLanguagesFromRoleInGroup;
    }
    forEach _groupName;
};

if (_multipleRoles) exitWith
{
    {
        [_languages, _side, _x, _groupName] call f_fnc_acre_removeLanguagesFromRoleInGroup;
    }
    forEach _role;
};

private _languagesKey = format ["--%1::%2::%3", [_side] call f_fnc_sideToString, toUpper _groupName, toUpper _role];

private _languageList = f_map_languageAssignments getOrDefault [_languagesKey, [], true];

{
    _languageList pushBackUnique _x;
} 
forEach _languages;

_languageList