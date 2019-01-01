#include "macros.hpp"

/*
	Eden kill-log renderer: List all kill-logs.

	USAGE:
	* Open the mission in the mission editor (aka 'Eden').

	* Use the 'Play' dropdown menu to load up the mission once (easiest way to do this is to choose multiplayer, go to the slotting screen and then come back).

	* Open up the debug console in the editor via the 'Tools' dropdown menu.

	* Type this into the code box at the top:
		[] call f_fnc_edenListKillLogs;

	* Click the 'Local exec' button.  A list of all available kill-logs will appear at the bottom corner of the map.

	* You can read the list to select a kill-log to view.  Choose a number and use it to show the log like so:
		[0, "Full"] call f_fnc_edenShowKillLog;

	* All markers created by these functions are temporary and will not be saved into the mission.
		To clear the markers, play the mission or use '[] call f_fnc_edenClearKillLogDisplay;'.

	TROUBLESHOOTING:
	* It doesn't work!
		Pay attention to step 2 of the USAGE section.  This needs to be done so that the framework's code is loaded into the editor.

*/

_killLogs = profileNamespace getVariable [FULL_KILL_LOG_KEY_CLIENT, []];


[] call f_fnc_edenClearKillLogDisplay;


_markerIdNum = 0;

{

	_markerName = format ["f_killmarker_%1", _markerIdNum];
	_markerIdNum = _markerIdNum + 1;

	_pos = [100, 50 * _markerIdNum, 0];

	_markerId = createMarker [_markerName, _pos];
	_markerId setMarkerType "hd_dot";
	_markerId setMarkerText format ["Log #%1: %2 entries", _forEachIndex, count _x];

} forEach _killLogs;


_markerName = format ["f_killmarker_%1", _markerIdNum];
_markerIdNum = _markerIdNum + 1;

_pos = [50, 50 * _markerIdNum, 0];

_markerId = createMarker [_markerName, _pos];
_markerId setMarkerType "hd_warning";
_markerId setMarkerText format ["%1 received kill logs:", count _killLogs];


f_var_currentDisplayedKillLogMarkers = _markerIdNum;

format ["Found %1 total kill logs.", count _killLogs]
