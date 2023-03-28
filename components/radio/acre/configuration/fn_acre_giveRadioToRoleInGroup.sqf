params ["_radio", "_channelName", "_side", "_role", "_groupName"];

private _multipleGroups = (typeName _groupName isEqualTo "ARRAY");
private _multipleRoles = (typeName _role isEqualTo "ARRAY");

if (_multipleGroups) exitWith
{
    {
        [_radio, _channelName, _side, _role, _x] call f_fnc_acre_giveRadioToRoleInGroup;
    }
    forEach _groupName;
};

if (_multipleRoles) exitWith
{
    {
        [_radio, _channelName, _side, _x, _groupName] call f_fnc_acre_giveRadioToRoleInGroup;
    }
    forEach _role;
};

[_radio, _channelName, _side] call f_fnc_acre_generateChannelForRadio;

private _radioKey = format ["%1::%2::%3", [_side] call f_fnc_sideToString, toUpper _groupName, toUpper _role];

private _radiosList = f_map_radioAssignments getOrDefault [_radioKey, [], true];

_radiosList pushBack [_radio, _channelName];

_radiosList