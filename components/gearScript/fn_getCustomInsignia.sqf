#include "macros.hpp"
#include "..\..\squadmarker_macros.hpp"

/*
    Gets the insignia that a unit should have, based on the configuration

    Params:
        Object - The unit in question

    Returns:
        String - The class name of the insignia the unit should have

*/

params ["_unit"];

private _faction = toLower (faction _unit);
private _unitType = _unit getVariable ["f_var_assignGear", ""];
private _insigniaVar = _unit getVariable ["f_var_insignia", ""];

private _insigniaClass = "";


#ifdef ENABLE_ADVANCED_INSIGNIA


// Attempt to set insignia from f_var_insignia
if (_insigniaVar isNotEqualTo "") then
{
    _insigniaClass = f_dict_insignia_custom getOrDefault [_insigniaVar, ""];
    DEBUG_FORMAT2_LOG("[INSIGNIA] Found insignia var %1, set class to %2 ", _insigniaVar, _insigniaClass)
};

// Attempt to set insignia from unit gearscript role
if ((_insigniaClass isEqualTo "") and {_unitType isNotEqualTo ""}) then
{
    _insigniaClass = f_dict_insignia_custom getOrDefault [_unitType, ""];
    DEBUG_FORMAT2_LOG("[INSIGNIA] Found unit type %1, set class to %2 ", _unitType, _insigniaClass)
};

// Attempt to set insignia from unit group callsign
if (_insigniaClass isEqualTo "") then
{
    private _callsign = groupId (group _unit);
    _insigniaClass = f_dict_insignia_custom getOrDefault [_callsign, ""];
    DEBUG_FORMAT2_LOG("[INSIGNIA] Found group callsign %1, set class to %2 ", _callsign, _insigniaClass)
};


#else


// Attempt to set insignia from f_var_insignia
if (_insigniaVar isNotEqualTo "") then
{
    _insigniaClass = f_dict_insignia_custom getOrDefault [_insigniaVar, ""];
};


#endif


// Fall back on unit group colour
if (_insigniaClass isEqualTo "") then
{
    private _group = group _unit;
    private _colour = SQUAD_COLOUR(_group);

    _insigniaClass = f_dict_insignia_colours getOrDefault [(str _colour), ""];

    if (_insigniaClass isEqualTo "") then
    {
        _insigniaClass = f_dict_insignia_colours getOrDefault [(str COLOUR_BLACK), ""];
    };

    if ((_insigniaClass isNotEqualTo "") and {_unitType in ["ftl", "sl", "co", "xo"]}) then
    {
        _insigniaClass = _insigniaClass + "_SL";
    };

};

_insigniaClass;