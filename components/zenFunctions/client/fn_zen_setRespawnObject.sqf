#include "macros.hpp"

params ["_position", "_object"];


    if (isNull _object) then
    {
       systemChat "No object found: respawner object unchanged.";
    };

	["Set Respawn Object", 
	[
		["SIDE", "Side", [[0, 1, 2, 3], ["WEST", "EAST", "INDEPENDENT", "CIVILIAN"], 0]],
	],
	{
		params ["_dialogValues", "_args"];
		_dialogValues params ["_side"];
		_args params ["_position", "_object"];


        _sideStr = str _side;
        _objectName = toLower ("respawner_" + _sideStr);

        missionNamespace setVariable [_objectName, _object, true];
        systemChat format ["Set %1 respawner object to '%2'.", _sideStr, typeOf _object];
        
    

	}, 
	{},
	[_object]] call zen_dialog_fnc_create;


