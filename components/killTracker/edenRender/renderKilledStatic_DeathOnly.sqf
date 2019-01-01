_renderKilledStatic_DeathOnly =
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
