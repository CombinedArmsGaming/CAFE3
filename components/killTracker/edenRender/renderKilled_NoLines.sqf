_renderKilled_NoLines =
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

};
