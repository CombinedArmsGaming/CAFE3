
/*
	Eden kill-log renderer: Clear kill-log display.

	USAGE:
	* Open the mission in the mission editor (aka 'Eden').

	* Use the 'Play' dropdown menu to load up the mission once (easiest way to do this is to choose multiplayer, go to the slotting screen and then come back).

	* Open up the debug console in the editor via the 'Tools' dropdown menu.

	* Type this into the code box at the top:
		[] call f_fnc_edenClearKillLogDisplay;

	* Click the 'Local exec' button.  A list of all available kill-logs will appear at the bottom corner of the map.

    * Any markers placed on the map by the kill-log viewer should disappear.

	TROUBLESHOOTING:
	* It doesn't work!
		Pay attention to step 2 of the USAGE section.  This needs to be done so that the framework's code is loaded into the editor.
        You can also clear the markers by playing the mission and returning to the editor.

*/

if !(isNil 'f_var_currentDisplayedKillLogMarkers') then
{
	for "_i" from 0 to f_var_currentDisplayedKillLogMarkers do
	{
		_markerName = format ["f_killmarker_%1", _i];
		deleteMarker _markerName;
	};

};


f_var_killerMapLines = [];
f_var_currentDisplayedKillLogMarkers = 0;
