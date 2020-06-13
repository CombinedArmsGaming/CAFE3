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
    	case "med": { "Patch_Medic" };
    	default {""};
    };

};


if (_insigniaClass isEqualTo "") then
{
    _group = group _unit;
    _colour = SQUAD_COLOUR(_group);

    if (_colour isEqualTo []) then
    {
        _colour = BLACK;
    };

    _colourValues =
    [
        RED,
        ORANGE,
        YELLOW,
        GREEN,
        BLUE,
        CYAN,
        MAGENTA,
        PINK,
        PURPLE,
        WHITE,
        LIGHTGREY,
        DARKGREY,
        BLACK,
        GREY,
        BROWN,
        KHAKI
    ];

    _colourPatches =
    [
        "Patch_Red",
        "Patch_Orange",
        "Patch_Yellow",
        "Patch_Green",
        "Patch_Blue",
        "Patch_Cyan",
        "Patch_Magenta",
        "Patch_Pink",
        "Patch_Purple",
        "Patch_White",
        "Patch_Grey",
        "Patch_Grey",
        "Patch_Black",
        "Patch_Grey",
        "Patch_Brown",
        "Patch_Khaki"
    ];

    {
        if (_colour isEqualTo _x) exitWith
        {
            _insigniaClass = (_colourPatches select _forEachIndex);
        };

    } forEach _colourValues;

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
