#define ENABLE_DEBUG
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
    private _uniform = "";
    private _vest = "";
    private _backpack = "";

    while {alive _unit} do
    {
        private _newUnitType = _unit getVariable ["f_var_assignGear", ""];
        private _newGroup = group _unit;
        private _newColour = SQUAD_COLOUR(_newGroup);
        private _newUniform = uniform _unit;
        private _newVest = vest _unit;
        private _newBackpack = backpack _unit;

        #ifdef ENABLE_DEBUG
            diag_log (format ["[INSIGNIA] Old unit type: %1, Old group %2, Old uniform %3, Old vest %4, Old backpack %5", _unitType, _group, _uniform, _vest, _backpack]);
            diag_log (format ["[INSIGNIA] New unit type: %1, new group %2, new uniform %3, new vest %4, new backpack %5", _newUnitType, _newGroup, _newUniform, _newVest, _newBackpack]);
        #endif

        if !((_unitType isEqualTo _newUnitType) and {_group isEqualTo _newGroup} and {_groupColour isEqualTo _newColour} and {_uniform isEqualTo _newUniform} and {_vest isEqualTo _newVest} and {_backpack isEqualTo _newBackpack}) then
        {
            [_unit] call f_fnc_applyInsignia;
        };

        _unitType = _newUnitType;
        _group = _newGroup;
        _groupColour = +_newColour;
        _uniform = _newUniform;
        _vest = _newVest;
        _backpack = _newBackpack;

        sleep 5;

    };

    _unit setVariable ["f_var_hasInsigniaMonitor", false, true];

};
