#include "macros.hpp"
#include "..\..\squadmarker_macros.hpp"

params ["_unit"];

_message = format ["[INSIGNIA]: Tried to apply insignia to %1 but was not running locally.",_unit];
LOCAL_ONLY_WARN(_unit, _message);


_faction = toLower (faction _unit);
_unitType = _unit getVariable ["f_var_assignGear", ""];
_insigniaVar = _unit getVariable ["f_var_insignia", ""];

_insigniaClass = "";


#ifdef ENABLE_ADVANCED_INSIGNIA


// Attempt to set insignia from f_var_insignia
if !(_insigniaVar isEqualTo "") then
{
    _insigniaClass = DICT_GET_DEFAULT(f_dict_insignia_custom,_insigniaVar,"");
};

// Attempt to set insignia from unit gearscript role
if (_insigniaClass isEqualTo "" and {!(_unitType isEqualTo "")}) then
{
    _insigniaClass = DICT_GET_DEFAULT(f_dict_insignia_custom,_unitType,"");
};

// Attempt to set insignia from unit group callsign
if (_insigniaClass isEqualTo "") then
{
    _group = group _unit;
    _callsign = groupId _group;
   _insigniaClass = DICT_GET_DEFAULT(f_dict_insignia_custom,_callsign,"");

};


#else


// Attempt to set insignia from f_var_insignia
if !(_insigniaVar isEqualTo "") then
{
    _insigniaClass = DICT_GET_DEFAULT(f_dict_insignia_custom,_insigniaVar,"");
};


#endif


// Fall back on unit group colour
if (_insigniaClass isEqualTo "") then
{
    _group = group _unit;
    _colour = SQUAD_COLOUR(_group);

    _insigniaClass = DICT_GET(f_dict_insignia_colours,(str _colour));

    if (_insigniaClass isEqualTo []) then
    {
        _insigniaClass = DICT_GET(f_dict_insignia_colours,(str COLOUR_BLACK));
    };

    if (_unitType in ["ftl", "sl", "co", "xo"]) then
    {
        _insigniaClass = _insigniaClass + "_SL";
    };

};


if (_insigniaClass != "") then
{
	private ["_texture", "_cfgTexture"];

	waitUntil
    {
        (uniform _unit) != ""
    };

	// Replicate behaviour of setInsignia
	_cfgTexture = [["CfgUnitInsignia", _insigniaClass], configFile] call bis_fnc_loadClass;

	if (_cfgTexture == configFile) exitWith
    {
        DEBUG_FORMAT1_LOG("'%1' not found in CfgUnitInsignia",_insigniaClass)
        false
    };

	_texture = getText (_cfgTexture >> "texture");
    _uniformInfos = getArray (configFile >> "CfgVehicles" >> getText (configFile >> "CfgWeapons" >> uniform _unit >> "ItemInfo" >> "uniformClass") >> "hiddenSelections");

	_index = -1;

	{
		if (_x == "insignia") exitwith
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

};
