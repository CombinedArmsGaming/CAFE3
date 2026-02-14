#include "macros.hpp"
#include "..\..\squadmarker_macros.hpp"

params ["_unit"];

RUN_LOCAL_TO(_unit,f_fnc_addInsigniaMonitor,_this);

DEBUG_FORMAT1_LOG("[INSIGNIA] Adding insignia monitor to %1", _unit);

if ((_unit getVariable ["f_var_hasInsigniaMonitor", false]) isEqualTo true) exitWith {DEBUG_PRINT_LOG("[INSIGNIA] Unit already had insignia monitor.")};

_unit setVariable ["f_var_hasInsigniaMonitor", true, true];

[_unit] spawn
{
    params ["_unit"];

    WAIT_UNTIL_MISSION_STARTED;

    private _unitType = "";
    private _group = grpNull;
    private _groupColour = [];
    private _insignia = "";
    
    while {alive _unit} do
    {
        private _newUnitType = _unit getVariable ["f_var_assignGear", ""];
        private _newGroup = group _unit;
        private _newColour = SQUAD_COLOUR(_newGroup);
        private _newInsignia = _unit call BIS_fnc_getUnitInsignia;

        #ifdef ENABLE_DEBUG
            diag_log (format ["[INSIGNIA] Old unit type: %1, Old group %2, Old group colour %3, Old insignia %4", _unitType, _group, _groupColour, _insignia]);
            diag_log (format ["[INSIGNIA] New unit type: %1, new group %2, New group colour %3, new insignia %4", _newUnitType, _newGroup, _newColour, _newInsignia]);
        #endif

        private _insigniaApplied = false;
        if !((_unitType isEqualTo _newUnitType) and {_group isEqualTo _newGroup} and {_groupColour isEqualTo _newColour} and {_insignia isEqualTo _newInsignia}) then
        {
            [_unit] call f_fnc_applyInsignia;
        };

        _unitType = _newUnitType;
        _group = _newGroup;
        _groupColour = +_newColour;
        _insignia = _unit call BIS_fnc_getUnitInsignia; // Update the insignia in case we changed it with applyInsignia

        sleep 5;

    };

    _unit setVariable ["f_var_hasInsigniaMonitor", false, true];

};
