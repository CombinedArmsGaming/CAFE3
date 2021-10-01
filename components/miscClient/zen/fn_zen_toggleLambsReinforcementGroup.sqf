#include "../macros.hpp"

// By: Gibbs!

// Toggles LAMBS Reinforcement on/off for the selected group.

CLIENT_ONLY;

params ["_object"];

if (isNull _object) exitWith { true };

private _group = group _object;

if (isNull _group) then
{
    ["No group found: Unable to toggle LAMBS reinforcement status."] call zen_common_fnc_showMessage;
}
else
{
    private _reinforceEnabled = _group getVariable ["lambs_danger_enableGroupReinforce", true];

    if (_reinforceEnabled) then
    {
        // Disable it
        _group setVariable ["lambs_danger_enableGroupReinforce", false, true];
        ["Disabled LAMBS Reinforcement for group %1.", groupId _group] call zen_common_fnc_showMessage;

    }
    else
    {
        // Otherwise enable it
        _group setVariable ["lambs_danger_enableGroupReinforce", true, true];
        ["Enabled LAMBS Reinforcement for group %1.", groupId _group] call zen_common_fnc_showMessage;

    };

};
