#include "macros.hpp"

params ["_input", "_value"];

if !(_value isEqualTo true or {_value isEqualTo false}) exitWith
{
    DEBUG_FORMAT2_LOG("[Gravestones] Tried to set gravestone-manager status of %1 to a non-boolean: %2",_input,_value)
};


switch (typeName _input) do
{
    case "OBJECT":
    {
        if !(_input isKindOf "CAManBase") exitWith
        {
            DEBUG_FORMAT1_LOG("[Gravestones] Tried to exempt a non-human from the gravestone manager: %1",_input)
        };

        _input setVariable ["f_var_allowGravestone", _value, true];
        DEBUG_FORMAT1_LOG("[Gravestones] Set UNIT exemption to: %1",_value)
    };

    case "GROUP":
    {
        _input setVariable ["f_var_allowGravestone", _value, true];
        DEBUG_FORMAT1_LOG("[Gravestones] Set GROUP exemption to: %1",_value)
    };

    default
    {
        DEBUG_FORMAT1_LOG("[Gravestones] f_fnc_allowGravestone only supports humans and groups, but was given %1 as input.",_input)
    };

};
