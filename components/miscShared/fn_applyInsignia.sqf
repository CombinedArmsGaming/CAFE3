#include "macros.hpp"
#include "..\..\squadmarker_macros.hpp"

params ["_unit"];

private _message = format ["[INSIGNIA]: Tried to apply insignia to %1 but was not running locally.",_unit];
LOCAL_ONLY_WARN(_unit, _message);


private _faction = toLower (faction _unit);
private _unitType = _unit getVariable ["f_var_assignGear", ""];
private _insigniaVar = _unit getVariable ["f_var_insignia", ""];

private _insigniaClass = "";


#ifdef ENABLE_ADVANCED_INSIGNIA


// Attempt to set insignia from f_var_insignia
if (_insigniaVar isNotEqualTo "") then
{
    _insigniaClass = f_dict_insignia_custom getOrDefault [_insigniaVar, ""];
};

// Attempt to set insignia from unit gearscript role
if ((_insigniaClass isEqualTo "") and {_unitType isNotEqualTo ""}) then
{
    _insigniaClass = f_dict_insignia_custom getOrDefault [_unitType, ""];
};

// Attempt to set insignia from unit group callsign
if (_insigniaClass isEqualTo "") then
{
    private _callsign = groupId _group;
    _insigniaClass = f_dict_insignia_custom getOrDefault [_callsign, ""];
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


if (_insigniaClass isNotEqualTo "") then
{
    DEBUG_FORMAT2_LOG("[INSIGNIA]: Found insignia '%2' for unit %1.",_unit,_insigniaClass)

	waitUntil
    {
        (uniform _unit) isNotEqualTo ""
    };

	// Replicate behaviour of setInsignia
	private _cfgTexture = [["CfgUnitInsignia", _insigniaClass], configFile] call bis_fnc_loadClass;

	if (_cfgTexture isEqualTo configFile) exitWith
    {
        DEBUG_FORMAT1_LOG("[INSIGNIA]: '%1' not found in CfgUnitInsignia",_insigniaClass)
        false
    };

	private _texture = getText (_cfgTexture >> "texture");
    private _uniformInfos = getArray (configFile >> "CfgVehicles" >> getText (configFile >> "CfgWeapons" >> uniform _unit >> "ItemInfo" >> "uniformClass") >> "hiddenSelections");

	private _index = -1;

	{
		if (_x isEqualTo "insignia") exitwith
        {
            _index = _forEachIndex;
        };

	} foreach _uniformInfos;

	if (_index >= 0) then
    {
        DEBUG_FORMAT2_LOG("[INSIGNIA]: Setting insignia of %1 to %2",_unit,_insigniaClass)
		_unit setVariable ["bis_fnc_setUnitInsignia_class", _insigniaClass, true];
        _unit setVariable ["f_arr_currentInsignia", [_index, _texture], true];
		_unit setObjectTextureGlobal [_index, _texture];
	};

}
else
{
    DEBUG_FORMAT1_LOG("[INSIGNIA]: Failed to find an insignia for unit %1.",_unit)
};
