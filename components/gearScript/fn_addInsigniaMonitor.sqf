#define ENABLE_DEBUG
#include "macros.hpp"

params ["_unit"];

RUN_LOCAL_TO(_unit,f_fnc_addInsigniaMonitor,_this);

DEBUG_FORMAT1_LOG("[INSIGNIA] Adding insignia monitor to %1", _unit);

if ((_unit getVariable ["f_var_hasInsigniaMonitor", false]) isEqualTo true) exitWith {DEBUG_PRINT_LOG("[INSIGNIA] Unit already had insignia monitor.")};

_unit setVariable ["f_var_hasInsigniaMonitor", true, true];

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
