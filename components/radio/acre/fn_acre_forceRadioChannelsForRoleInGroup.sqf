// ACRE integration for CAFE, by Bubbus

params ["_role", "_groupId", "_channelNamesArray"];

if (isNil "f_map_acre_forcedRoles") then
{
    f_map_acre_forcedRoles = createHashMap;
};

private _key = format ["%1::%2", toUpper _groupId, toUpper _role];

f_map_acre_forcedRoles set [_key, _channelNamesArray];