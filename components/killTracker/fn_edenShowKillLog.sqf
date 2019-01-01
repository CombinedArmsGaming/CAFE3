#include "macros.hpp"

params ["_index"];

_killLogs = profileNamespace getVariable [FULL_KILL_LOG_KEY_CLIENT, []];

if (count _killLogs <= _index) exitWith
{
	format ["%1 is not a valid index.  Use f_fnc_edenListKillLogs to see valid indices.", _index]
};

_killTracking = _killLogs select _index;


_chooseColour =
{
	params ["_type", "_side"];

	_ret = "";

	if (_side == east and {toUpper _type isEqualTo "CIV"}) exitWith {"ColorCIV"};

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


_renderSuicide =
{
	params ["_entry"];

	_time = _entry select 1;
	_victim = _entry select 2;

	_type = _victim select 0;
	_side = _victim select 1;
	_name = _victim select 2;
	_position = _victim select 3;
	_dir = _victim select 4;

	_timeStr = _time call BIS_fnc_timeToString;
	_colour = [_type, _side] call _chooseColour;
	_text = format ["Suicide @ %3: %1 (%2)", _name, _type, _timeStr];

	_markerIdNum = f_var_currentDisplayedKillLogMarkers;
	_markerName = format ["f_killmarker_%1", _markerIdNum];

	_markerId = createMarker [_markerName, _position];
	_markerId setMarkerType "mil_dot";
	_markerId setMarkerColor _colour;
	_markerId setMarkerText _text;

	f_var_currentDisplayedKillLogMarkers = _markerIdNum + 1;

};


_renderKilled =
{
	params ["_entry"];

	_time = _entry select 1;
	_timeStr = _time call BIS_fnc_timeToString;

	_victim = _entry select 2;
	_killer = _entry select 3;


	// victim stuff
	_vicType = _victim select 0;
	_vicSide = _victim select 1;
	_vicName = _victim select 2;
	_vicPos = _victim select 3;
	_vicDir = _victim select 4;

	_vicColour = [_vicType, _vicSide] call _chooseColour;
	_vicText = format ["Killed @ %3: %1 (%2)", _vicName, _vicType, _timeStr];

	_markerIdNum = f_var_currentDisplayedKillLogMarkers;
	_markerName = format ["f_killmarker_%1", _markerIdNum];

	_markerId = createMarker [_markerName, _vicPos];
	_markerId setMarkerType "mil_dot";
	_markerId setMarkerColor _vicColour;
	_markerId setMarkerText _vicText;

	f_var_currentDisplayedKillLogMarkers = _markerIdNum + 1;


	// killer stuff

	_killerType = _killer select 0;
	_killerSide = _killer select 1;
	_killerName = _killer select 2;
	_killerPos = _killer select 3;
	_killerDir = _killer select 4;

	_killerColour = [_killerType, _killerSide] call _chooseColour;
	_killerText = format ["Shooter: %1 (%2)", _killerName, _killerType, _timeStr];

	_markerIdNum = f_var_currentDisplayedKillLogMarkers;
	_markerName = format ["f_killmarker_%1", _markerIdNum];

	_markerId = createMarker [_markerName, _killerPos];
	_markerId setMarkerType "mil_arrow2";
	_markerId setMarkerDir _killerDir;
	_markerId setMarkerColor _killerColour;
	_markerId setMarkerText _killerText;
	_markerId setMarkerSize [0.5, 0.5];

	f_var_currentDisplayedKillLogMarkers = _markerIdNum + 1;


	// kill line stuff

	_killerColourConfig = getArray (configFile >> "CfgMarkerColors" >> _killerColour >> "color");
	_killerColourValues = [0,0,0,1];

	if !(_killerColourConfig isEqualTo []) then
	{
		_killerColourValues = _killerColourConfig call BIS_fnc_colorConfigToRGBA;
	};

	f_var_killerMapLines pushBack [_killerPos, _vicPos, _killerColourValues];

};


_renderKilledStatic =
{
	params ["_entry"];

	_typeBefore = _entry select 1;
	_typeAfter = _entry select 2;
	_isRuin = _entry select 3;
	_position = _entry select 4;

	_ruinText = "DAMAGED";
	if (_isRuin) then {_ruinText = "RUINED";};

	_text = format ["%3: %1 (now %2)", _typeBefore, _typeAfter, _ruinText];
	_colour = "ColorUNKNOWN";

	_markerIdNum = f_var_currentDisplayedKillLogMarkers;
	_markerName = format ["f_killmarker_%1", _markerIdNum];

	_markerId = createMarker [_markerName, _position];
	_markerId setMarkerType "mil_dot";
	_markerId setMarkerColor _colour;
	_markerId setMarkerText _text;

	f_var_currentDisplayedKillLogMarkers = _markerIdNum + 1;

};


if !(isNil 'f_var_currentDisplayedKillLogMarkers') then
{
	for "_i" from 0 to f_var_currentDisplayedKillLogMarkers do
	{
		_markerName = format ["f_killmarker_%1", _i];
		systemChat _markerName;
		deleteMarker _markerName;
	};

};


f_var_killerMapLines = [];
f_var_currentDisplayedKillLogMarkers = 0;


if (isNil 'f_var_mapDrawHandlerId') then
{
	f_var_mapDrawHandlerId = (findDisplay 313 displayCtrl 51) ctrlAddEventHandler
	[
		"Draw",
		{
			if (isNil 'f_var_mapDrawHandlerId') exitWith {};

			_map = _this select 0;

			{
				_map drawLine _x;

			} forEach f_var_killerMapLines;

		}

	];

};


{

	_entry = _x;
	_entryType = _entry select 0;


	if (_entryType isEqualTo "Killed") then
	{
		[_entry] call _renderKilled;
	};

	if (_entryType isEqualTo "Suicide") then
	{
		[_entry] call _renderSuicide;
	};

	if (_entryType isEqualTo "KilledStatic") then
	{
		[_entry] call _renderKilledStatic;
	};

} forEach _killTracking;


format ["Found %1 total entries for kill log #%2.", count _killTracking, _index]
