#include "macros.hpp"
#include "..\..\squadmarker_macros.hpp"

params ["_unit"];

LOCAL_ONLY(_unit);


_faction = toLower (faction _unit);
_unitType = _unit getVariable ["f_var_assignGear", ""];

_insigniaClass = "";


if !(_unitType isEqualTo "") then
{
    _insigniaClass = switch (_unitType) do
    {
    	case "med": { "insignia_GI_Medic" };
        case "zeus": { "Curator" };
    	default {""};
    };

};


if (_insigniaClass isEqualTo "") then
{
    _group = group _unit;
    _colour = SQUAD_COLOUR(_group);

    _insigniaClass = DICT_GET(f_dict_insignia_colours,(str _colour));

    if (_insigniaClass isEqualTo []) then
    {
        _insigniaClass = DICT_GET(f_dict_insignia_colours,(str BLACK));
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
		_unit setVariable ["bis_fnc_setUnitInsignia_class", _insigniaClass, true];
		_unit setObjectTextureGlobal [_index, _texture];
	};

};
