#include "macros.hpp"
#include "..\..\squadmarker_macros.hpp"

params ["_unit", ["_insigniaClass", ""]];

private _message = format ["[INSIGNIA]: Tried to apply insignia to %1 but was not running locally.",_unit];
LOCAL_ONLY_WARN(_unit, _message);

if (_insigniaClass isNotEqualTo "") then
{
    DEBUG_FORMAT2_LOG("[INSIGNIA]: Found final insignia class '%2' for unit %1.",_unit,_insigniaClass)

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
		if (toLower (_x) isEqualTo "insignia") exitwith
        {
            _index = _forEachIndex;
        };

	} foreach _uniformInfos;

    DEBUG_FORMAT2_LOG("[INSIGNIA]: Setting insignia of %1 to %2",_unit,_insigniaClass)
	if (_index >= 0) then
    {
        // Apply the insignia in every way we know, for maximum application consistency
		_unit setVariable ["bis_fnc_setUnitInsignia_class", _insigniaClass, true];
        _unit setVariable ["f_arr_currentInsignia", [_index, _texture], true];
		_unit setObjectTextureGlobal [_index, _texture];
	};

    // Apply the insignia in the same way ACE arsenal does it to make sure all variables are set correctly
    [_unit, ""] call BIS_fnc_setUnitInsignia; // Clearing the insignia first is required. Unknown reason.
    [_unit, _insigniaClass] call BIS_fnc_setUnitInsignia;

}
else
{
    DEBUG_FORMAT1_LOG("[INSIGNIA]: Failed to find an insignia for unit %1.",_unit)
};
