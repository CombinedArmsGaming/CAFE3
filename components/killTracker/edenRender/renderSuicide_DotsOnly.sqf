_renderSuicide_DotsOnly =
{
	params ["_entry"];

	_victim = _entry select 2;

	_type = _victim select 0;
	_side = _victim select 1;
	_name = _victim select 2;
	_position = _victim select 3;
	_dir = _victim select 4;

	_colour = [_type, _side] call _chooseColour;
	_text = "";

	_markerIdNum = f_var_currentDisplayedKillLogMarkers;
	_markerName = format ["f_killmarker_%1", _markerIdNum];

	_markerId = createMarker [_markerName, _position];
	_markerId setMarkerType "mil_dot";
	_markerId setMarkerColor _colour;
	_markerId setMarkerText _text;

	f_var_currentDisplayedKillLogMarkers = _markerIdNum + 1;

};
