/* --------------------------------------------------------------------------------------------------------------------
	Author:		Emma
	Description:
		Loop which handles updating median FPS value and raising list event if necessary
	Arguments:
		(nothing)
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */
#include "macros.hpp"

SERVER_ONLY_WARN("[ZEUS_NOTIFIER] Fps update loop called on client!");

// Collect all of the fps values from clients
private _fpsArray = [];
private _lowFpsPlayers = [];
{
	private _fps = _x getVariable [MACRO_VARNAME_FPS_LOG, false];
	if (_fps isEqualType 0) then {
		_fps = round _fps;

		// Add player's fps to array
		_fpsArray pushBack _fps;

		// If the player has low fps, note their name and FPS
		if (_fps < LOW_FPS_VALUE) then {
			_lowFpsPlayers pushBack ((name _x) + ": " + (str _fps) + "fps");
		};
	};
} forEach allPlayers;

// Start _medianFps high
private _medianFps = LOW_FPS_VALUE + 1;

if ((count _fpsArray > 0)) then {
	_fpsArray sort true;

	_medianFps = _fpsArray select ((count _fpsArray) / 2);
};

private _notifHashMap = missionNamespace getVariable [MACRO_VARNAME_NOTIFIER_MAP, createHashMap];
private _listName = NOTIFIER_LIST_LOW_FPS # 0;
private _hashmapUpdated = false;

if (_medianFps < LOW_FPS_VALUE) then {
	_lowFpsPlayers insert [0, [format ["Median: %1fps", _medianFps]]];
	
	// Only need to update the notifHashMap if the list of low fps players has changed
	if ((_notifHashMap getOrDefault [_listName, []]) isNotEqualTo _lowFpsPlayers) then {
		_hashmapUpdated = true;
		_notifHashMap set [_listName, _lowFpsPlayers];
		DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Added low fps players list to hashmap. List: %1", _lowFpsPlayers);
	};
} else {
	if ((_notifHashMap getOrDefault [_listName, []]) isNotEqualTo []) then {
		_hashmapUpdated = true;
		_notifHashMap set [_listName, []];
	};
};

if (_hashmapUpdated) then {
	missionNamespace setVariable [MACRO_VARNAME_NOTIFIER_MAP, _notifHashMap, true];

	private _zeuses = allPlayers select {_x getVariable ["f_var_isZeus", false]};
	if (count _zeuses > 0) then {
		DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Server: Firing low FPS event on zeus clients %1", _zeuses apply {name _x});
		[
			MACRO_VARNAME_SERVER_NOTIF_EVENT,
			[_listName],
			_zeuses
		] call CBA_fnc_targetEvent;
	} else {
		DEBUG_PRINT_LOG("[ZEUS_NOTIFIER] Server: Updated hashmap but there are no zeuses to hear about it.");
	};
};

[
	f_fnc_fpsUpdateLoop,
	[],
	5
] call CBA_fnc_waitAndExecute;