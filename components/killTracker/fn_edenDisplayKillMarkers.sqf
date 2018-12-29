#include "macros.hpp"

// if (!is3den) exitWith
// {
	// systemChat "This command is only available within the mission editor.";
// };

/* _keyName = missionNamespace getVariable ["f_var_killTrackingKey", ""];

if (_keyName isEqualTo "") then
{
	[] call compile preprocessFileLineNumbers "initServer.sqf";
	_keyName = missionNamespace getVariable ["f_var_killTrackingKey", ""];

	if (_keyName isEqualTo "") exitWith
	{
		systemChat "Was not able to load Kill-tracking key.  Please define one in initServer.sqf.";
	};

}; */

//_fullKeyName = format ["f_var_killTracking_%1_received", _keyName];
_killTracking = profileNamespace getVariable [FULL_KILL_LOG_KEY_CLIENT, []];


_chooseColour =
{
	params ["_side"];

	_ret = "";

	switch (_side) do
	{
		case west: {_ret = "ColorWEST";};
		case east: {_ret = "ColorEAST";};
		case sideUnknown: {_ret = "ColorCIV";};
		case CIVILIAN: {_ret = "ColorCIV";};
		case INDEPENDENT: {_ret = "ColorGUER";};
	};

	_ret
};


_markerIdNum = 0;

{
	_entry = _x;
	_entryType = _entry select 0;

	_text = "";
	_colour = "";
	_pos = [];

	if (_entryType isEqualTo "Killed") then
	{
		_type = _entry select 1;
		_side = _entry select 2;
		_name = _entry select 3;
		_position = _entry select 4;
		_dir = _entry select 5;


		_colour = [_side] call _chooseColour;

		if (_side == east and {toUpper _type isEqualTo "CIV"}) then
		{
			_colour = "ColorCIV";
			_type = "STONER";
		};

		_text = format ["KILLED: %1 (%2)", _name, _type];

		_pos = _position;
	};

	if (_entryType isEqualTo "KilledStatic") then
	{
		_typeBefore = _entry select 1;
		_typeAfter = _entry select 2;
		_isRuin = _entry select 3;
		_position = _entry select 4;

		_ruinText = "DAMAGED";
		if (_isRuin) then {_ruinText = "RUINED";};

		_text = format ["%3: %1 (now %2)", _typeBefore, _typeAfter, _ruinText];
		_colour = "ColorUNKNOWN";
		_pos = _position;

	};

	_markerName = format ["f_killmarker_%1", _markerIdNum];
	_markerIdNum = _markerIdNum + 1;

	_markerId = createMarker [_markerName, _pos];
	_markerId setMarkerType "hd_dot";
	_markerId setMarkerColor _colour;
	_markerId setMarkerText _text;

} forEach _killTracking;
