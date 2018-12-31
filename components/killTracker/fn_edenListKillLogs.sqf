#include "macros.hpp"


_killLogs = profileNamespace getVariable [FULL_KILL_LOG_KEY_CLIENT, []];


if !(isNil 'f_var_currentDisplayedKillLogMarkers') then
{
	for "_i" from 0 to f_var_currentDisplayedKillLogMarkers do
	{
		_markerName = format ["f_killmarker_%1", _i];
		deleteMarker _markerName;
	};

};


_markerIdNum = 0;


{

	_markerName = format ["f_killmarker_%1", _markerIdNum];
	_markerIdNum = _markerIdNum + 1;

	_pos = [200, 100 * _markerIdNum, 0];

	_markerId = createMarker [_markerName, _pos];
	_markerId setMarkerType "hd_dot";
	_markerId setMarkerText format ["Log #%1: %2 entries", _forEachIndex, count _x];

} forEach _killLogs;


_markerName = format ["f_killmarker_%1", _markerIdNum];
_markerIdNum = _markerIdNum + 1;

_pos = [100, 100 * _markerIdNum, 0];

_markerId = createMarker [_markerName, _pos];
_markerId setMarkerType "hd_warning";
_markerId setMarkerText format ["%1 received kill logs:", count _killLogs];


f_var_currentDisplayedKillLogMarkers = _markerIdNum;

format ["Found %1 total kill logs.", count _killLogs]
