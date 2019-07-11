#include "macros.hpp"

/*
	Eden kill-log renderer: Show kill-log.

	USAGE:
	* Open the mission in the mission editor (aka 'Eden').

	* Use the 'Play' dropdown menu to load up the mission once (easiest way to do this is to choose multiplayer, go to the slotting screen and then come back).

	* Open up the debug console in the editor via the 'Tools' dropdown menu.

	* Type this into the code box at the top:
		[] call f_fnc_edenListKillLogs;

	* Click the 'Local exec' button.  A list of all available kill-logs will appear at the bottom corner of the map.

	* Choose a kill-log to view and type this into the code box:
		[0, "Full"] call f_fnc_edenShowKillLog;

		This will show full details for log number 0.  Choose any number that appeared in the list.  You can also choose "DeathOnly" and "NoLines" as detail options.

	* Click the 'Local' button.  The kill-log will be displayed on the map.

	* All markers created by these functions are temporary and will not be saved into the mission.
		To clear the markers, play the mission or use '[] call f_fnc_edenClearKillLogDisplay;'.

	TROUBLESHOOTING:
	* It doesn't work!
		Pay attention to step 2 of the USAGE section.  This needs to be done so that the framework's code is loaded into the editor.

	* It looks confusing!
		You can simplify the display by using the "DeathOnly" and "NoLines" detail options (step 6 of USAGE).

	PARAMETERS:
	0: _index
		The index of the kill-log to use.  Kill-logs are stored per-mission in an array: each play-session adds a new kill-log to the array.

	1: _lod
		The level of detail to use for the display.
	VALUES:
		"Full" 		- Full display including victims, killers and lines between them.
		"DeathOnly" - Show only deaths, omittong killers and lines between them.
		"NoLines"	- Show killers and victims, but omit the lines between them.

*/

params ["_index", ["_lod","full"]];

_killLogs = profileNamespace getVariable [FULL_KILL_LOG_KEY_CLIENT, []];

if (count _killLogs <= _index) exitWith
{
	format ["%1 is not a valid index.  Use f_fnc_edenListKillLogs to see valid indices.", _index]
};

_killTracking = _killLogs select _index;


#include "..\edenRender\chooseColour.sqf"

#include "..\edenRender\renderSuicide_Full.sqf"
#include "..\edenRender\renderSuicide_DotsOnly.sqf"

#include "..\edenRender\renderKilled_Full.sqf"
#include "..\edenRender\renderKilled_DeathOnly.sqf"
#include "..\edenRender\renderKilled_NoLines.sqf"
#include "..\edenRender\renderKilled_DotsOnly.sqf"
#include "..\edenRender\renderKilled_DotsAndLines.sqf"

#include "..\edenRender\renderKilledStatic_DeathOnly.sqf"
#include "..\edenRender\renderKilledStatic_DotsOnly.sqf"


[] call f_fnc_edenClearKillLogDisplay;
[] call f_fnc_edenCreateLineDrawer;


_renderKilled = _renderKilled_Full;
_renderSuicide = _renderSuicide_Full;
_renderKilledStatic = _renderKilledStatic_DeathOnly;


if (tolower _lod == "deathonly") then
{
	_renderKilled = _renderKilled_DeathOnly;
};

if (tolower _lod == "nolines") then
{
	_renderKilled = _renderKilled_NoLines;
};

if (tolower _lod == "dotsonly") then
{
	_renderKilled = _renderKilled_DotsOnly;
	_renderSuicide = _renderSuicide_DotsOnly;
	_renderKilledStatic = _renderKilledStatic_DotsOnly;
};

if (tolower _lod == "dotsandlines") then
{
	_renderKilled = _renderKilled_DotsAndLines;
	_renderSuicide = _renderSuicide_DotsOnly;
	_renderKilledStatic = _renderKilledStatic_DotsOnly;
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
