#include "macros.hpp"

// By: Gibbs!

// Toggles LAMBS Reinforcement on/off for the selected group.

params ["_object"];

if (isNull _object) exitWith { true };
_group = group _object;
if (isNull _group) then
{
    systemChat "No group found: Unable to toggle LAMBS reinforcement status.";
}
else
{
    // Get current value (would do in the if statement but it gave me an error, whatever)
    _currentValue = _group getVariable["lambs_danger_enableGroupReinforce", true];

    // If the variable is already set
    if (_currentValue) then
    {
        // Disable it
        _group setVariable ["lambs_danger_enableGroupReinforce", false, true];
        systemChat format ["Disabled LAMBS Reinforcement for group %1.", groupId(_group)];

    }
    else
    {
        // Otherwise enable it
        _group setVariable ["lambs_danger_enableGroupReinforce", true, true];
        systemChat format ["Enabled LAMBS Reinforcement for group %1.", groupId(_group)];

    };    
    
};
