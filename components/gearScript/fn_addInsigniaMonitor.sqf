#include "macros.hpp"
#include "..\..\squadmarker_macros.hpp"

params ["_unit"];

RUN_LOCAL_TO(_unit,f_fnc_addInsigniaMonitor,_this);

if ((_unit getVariable ["f_var_hasInsigniaMonitor", false]) isEqualTo true) exitWith {};

_unit setVariable ["f_var_hasInsigniaMonitor", true, true];

[_unit] spawn
{
    params ["_unit"];

    WAIT_UNTIL_MISSION_STARTED;

    private _unitType = "";
    private _group = grpNull;
    private _groupColour = [];
    private _uniform = "";

    while {alive _unit} do
    {
        private _newUnitType = _unit getVariable ["f_var_assignGear", ""];
        private _newGroup = group _unit;
        private _newColour = SQUAD_COLOUR(_newGroup);
        private _newUniform = uniform _unit;

        if !((_unitType isEqualTo _newUnitType) and {_group isEqualTo _newGroup} and {_groupColour isEqualTo _newColour} and {_uniform isEqualTo _newUniform}) then
        {
            [_unit] call f_fnc_applyInsignia;
        };

        _unitType = _newUnitType;
        _group = _newGroup;
        _groupColour = +_newColour;
        _uniform = _newUniform;

        sleep 5;

    };

    _unit setVariable ["f_var_hasInsigniaMonitor", false, true];

};
