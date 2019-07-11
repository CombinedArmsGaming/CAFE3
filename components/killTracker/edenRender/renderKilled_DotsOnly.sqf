_renderKilled_DotsOnly =
{
	params ["_entry"];

	_victim = _entry select 2;

	// victim stuff
	_vicType = _victim select 0;
	_vicSide = _victim select 1;
	_vicName = _victim select 2;
	_vicPos = _victim select 3;
	_vicDir = _victim select 4;

	_vicColour = [_vicType, _vicSide] call _chooseColour;
	_vicText = "";

	_markerIdNum = f_var_currentDisplayedKillLogMarkers;
	_markerName = format ["f_killmarker_%1", _markerIdNum];

	_markerId = createMarker [_markerName, _vicPos];
	_markerId setMarkerType "mil_dot";
	_markerId setMarkerColor _vicColour;
	_markerId setMarkerText _vicText;

	f_var_currentDisplayedKillLogMarkers = _markerIdNum + 1;

};
