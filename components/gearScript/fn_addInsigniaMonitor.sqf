#include "macros.hpp"

params ["_unit"];

// JIP players have units created on the server first, then transferred to their machine.
// This function is run from the init box of the unit, which runs on the server and on the client.
// This check ensures it is running on the correct machine.
// RUN_LOCAL_TO is not good enough, because the unit is local to the server initially. 
if (player isNotEqualTo _unit) exitWith {DEBUG_FORMAT2_LOG("[INSIGNIA] Did not add insignia monitor to unit %1, because this machine is player %2", _unit, player)};


DEBUG_FORMAT1_LOG("[INSIGNIA] Adding insignia monitor to %1", _unit);

if ((_unit getVariable ["f_var_hasInsigniaMonitor", false]) isEqualTo true) exitWith {DEBUG_PRINT_LOG("[INSIGNIA] Unit already had insignia monitor.")};

_unit setVariable ["f_var_hasInsigniaMonitor", true, true];

// Add event handler for instant updating when the uniform is changed
_unit addEventHandler ["SlotItemChanged", {
	params ["_unit", "_name", "_slot", "_assigned", "_weapon"];
    
    // Check if the uniform changed
    // Note:
    //      This event is generated twice whenever uniform is changed. 
    //      Once with the old uniform and _assigned = false, and once with the new uniform and _assigned = true
    //      Checking _assigned makes sure we only handle it once, but we can handle it on false or true it doesn't matter
    if (_slot isEqualTo 801 and _assigned isEqualTo true) then {
        DEBUG_FORMAT1_LOG("[INSIGNIA] Detected uniform change on unit %1", _unit)

        private _insigniaClass = _unit call f_fnc_getCustomInsignia;
        private _detectedInsignia = _unit call BIS_fnc_getUnitInsignia;

        DEBUG_FORMAT2_LOG("[INSIGNIA] Unit has insignia: %1, Unit should have insignia: %2", _detectedInsignia, _insigniaClass);

        if (_insigniaClass isNotEqualTo _detectedInsignia) then {
            [_unit, _insigniaClass] call f_fnc_applyInsignia;
        };
    };
}];

[_unit] spawn
{
    params ["_unit"];

    WAIT_UNTIL_MISSION_STARTED;
    
    while {alive _unit} do
    {
        private _insigniaClass = _unit call f_fnc_getCustomInsignia;
        
        private _detectedInsignia = _unit call BIS_fnc_getUnitInsignia;

        DEBUG_FORMAT2_LOG("[INSIGNIA] Unit has insignia: %1, Unit should have insignia: %2", _detectedInsignia, _insigniaClass);

        if (_insigniaClass isNotEqualTo _detectedInsignia) then
        {
            [_unit, _insigniaClass] call f_fnc_applyInsignia;
        };

        sleep 5;

    };

    _unit setVariable ["f_var_hasInsigniaMonitor", false, true];
};
