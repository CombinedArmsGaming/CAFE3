#include "macros.hpp"
#include "..\..\notifier_macros.hpp"

// Save an array of all the list names for future use
private _allListNames = NOTIFIER_ALL_LISTS apply {_x # 0};
missionNamespace setVariable [MACRO_VARNAME_ALL_LIST_NAMES, _allListNames];

// Save a hashmap for future reference of list titles
private _listTitleHashmap = createHashMapFromArray NOTIFIER_ALL_LISTS;
missionNamespace setVariable [MACRO_VARNAME_LIST_TITLE_HASHMAP, _listTitleHashmap];

if (isServer) then {
	// Setup for zeus notifier. See notifierInfo.txt for more information.

	// Create hash map to store the lists of players
	private _notifHashMap = createHashMap;
	missionNamespace setVariable [MACRO_VARNAME_NOTIFIER_MAP, _notifHashMap, true];

	// Start up fps monitor loop
	call f_fnc_fpsUpdateLoop;

	// Create event handler for when a player disconnects
	// This handler also fires when a player presses "abort" and goes back to role select
	addMissionEventHandler ["PlayerDisconnected", {
		params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
		DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Player %1 disconnected", _name);

		// Raise an event with ourselves removing the player from every list
		private _allListNames = missionNamespace getVariable [MACRO_VARNAME_ALL_LIST_NAMES, []];
		{
			[
				NOTIFIER_CLIENT_NEW_NOTIF_EVENT,
				[_x, _name, true]
			] call CBA_fnc_serverEvent;
		} forEach _allListNames;
	}];

	// Create event handler for new client notifications
	[
		NOTIFIER_CLIENT_NEW_NOTIF_EVENT,
		{
			_thisArgs params ["_allListNames"];

			private _argsCorrect = _this params [["_listName", "", [""]], ["_playerName", "", [""]], ["_removeFromList", false, [false]]];
			DEBUG_FORMAT3_LOG("[ZEUS_NOTIFIER] Server: Handling client event with list name %1, player name %2, removeFromList %3.", _listName, _playerName, _removeFromList);
			if (!_argsCorrect) exitWith {
				DEBUG_PRINT_LOG("[ZEUS_NOTIFIER] Server: Received event with badly formed args. Args should be string list name, string player name, bool removeFromList.");
			};

			if (!(_listName in _allListNames)) exitWith {
				private _str = format ["[ZEUS_NOTIFIER] Server: Received event with unknown list name: %1. Ignoring.", _listName];
				DEBUG_PRINT_CHAT(_str);
				diag_log(_str);
			};

			// Fetch hash map
			private _notifHashMap = missionNamespace getVariable [MACRO_VARNAME_NOTIFIER_MAP, false];
			if (_notifHashMap isEqualTo false) exitWith {
				diag_log "[ZEUS_NOTIFIER] Server: Event raised before notification hash map was initialized!";
			};

			// Fetch current client list
			private _notifList = _notifHashMap getOrDefault [_listName, [], true];

			// Keep track of if this event actually changed anything
			private _hashmapUpdated = false;

			if (!_removeFromList) then {
				// Add the player to the list. 
				private _idx = _notifList pushBackUnique _playerName;
				// If the player is not on the list, then the list has updated
				if (_idx != -1) then {
					_hashmapUpdated = true; 
					DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Server: Added player %1 to list %2", _playerName, _listName);
				} else {
					DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Server: Did not add player %1 to list %2 because they are already there.", _playerName, _listName);
				};
			} else {
				// Delete player from list if they are there.
				// It's not a problem if they are already removed, since that is not necessarily known by clients.
				private _idx = _notifList find _playerName;
				if (_idx > -1) then {
					_notifList deleteAt _idx;
					_hashmapUpdated = true;
					DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Server: Removed player %1 from list %2", _playerName, _listName);
				} else {
					DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Server: Tried to remove player %1 from list %2 but they were not there.", _playerName, _listName);
				};
			};

			// If the hashmap changed, save its new value and raise events to all zeus clients
			DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Server: hashmapUpdated: %1. Hashmap: %2", _hashmapUpdated, _notifHashMap);
			if (_hashmapUpdated) then {
				_notifHashMap set [_listName, _notifList];
				missionNamespace setVariable [MACRO_VARNAME_NOTIFIER_MAP, _notifHashMap, true];

				private _zeuses = allPlayers select {_x getVariable ["f_var_isZeus", false]};
				if (count _zeuses > 0) then {
					DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Server: Firing event on zeus clients %1", _zeuses apply {name _x});
					[
						MACRO_VARNAME_SERVER_NOTIF_EVENT,
						[_listName],
						_zeuses
					] call CBA_fnc_targetEvent;
				} else {
					DEBUG_PRINT_LOG("[ZEUS_NOTIFIER] Server: Updated hashmap but there are no zeuses to hear about it.");
				};
			}
		},
		[_allListNames]
	] call CBA_fnc_addEventHandlerArgs;
};

CLIENT_ONLY;

DEBUG_PRINT_LOG("[Zeus] Initting Zeus components");

// Start up client FPS logging
call f_fnc_client_fpsLogLoop;

cafe_zeusUI_isInitialised = false;