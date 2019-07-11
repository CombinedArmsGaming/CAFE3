_renderKilled_DotsAndLines =
{
	params ["_entry"];

	_victim = _entry select 2;
	_killer = _entry select 3;


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


	// killer stuff

	_killerType = _killer select 0;
	_killerSide = _killer select 1;
	_killerName = _killer select 2;
	_killerPos = _killer select 3;
	_killerDir = _killer select 4;

	_killerColour = [_killerType, _killerSide] call _chooseColour;
	_killerText = "";

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
