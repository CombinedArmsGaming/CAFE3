#include "../macros.hpp"

params ["_position", "_object"];

if !(["acre_sys_radio"] call ace_common_fnc_isModLoaded) exitWith
{
	["This module is only compatible with ACRE."] call zen_common_fnc_showMessage;
};

if (!alive _object) exitWith 
{
    ["Must use this module upon a unit (not dead)."] call zen_common_fnc_showMessage;
};

private _group = group _object;
private _groupId = groupId _group;
private _sideName = [side _group] call f_fnc_sideToString;

{
    private _channelOverrideKey = format ["f_var_acre_groupRadio::%1::%2::%3", _sideName, _groupId, _x];
    missionNamespace setVariable [_channelOverrideKey, nil, true];
}
forEach f_arr_acre_allRadios;

[
    {
        private _players = units (_this#0);
        _players = _players select {(alive _x) and {isPlayer _x} and {_x isKindOf "CAManBase"}};

        {
            ["", _x] remoteExec ["f_fnc_configureUnitRadios", _x];
        }
        foreach _players;
    },
    [_group],
    1
] call CBA_fnc_waitAndExecute;

["Group custom channels deleted.  All members' channels reset.  No new radios given."] call zen_common_fnc_showMessage;