_renderSuicide_Full =
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
