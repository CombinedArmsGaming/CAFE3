
case "ui_notifier_refresh": {
	_eventExists = true;
	// Options:
	//		If the changed list was visible: Find its index in the tree
	//			If the changed list has content: Delete and re-add its contents
	//			If the changed list does not have content: Delete the list from the tree
	//		If the changed list was not visible: 
	//			If the changed list has content: Add the list and its contents to the tree
	//			If the changed list does not have content: Do nothing

	// Update the notif hash map from the server
	private _notifHashMap = missionNamespace getVariable [MACRO_VARNAME_NOTIFIER_MAP, false];
	if (_notifHashMap isEqualTo false) exitWith {
		private _str = "[ZEUS_NOTIFIER] Client: Notifier refresh event raised but notifier map does not exist.";
		DEBUG_PRINT_CHAT(_str);
		DEBUG_PRINT_LOG(_str);
	};

	// The changed list should be passed by the event handler
	_args params [["_changedList", "", [""]]];
	if (_changedList isEqualTo "") exitWith {
		DEBUG_PRINT_LOG("[ZEUS_NOTIFIER] Client: Event was raised but with no changed list argument.");
	};

	systemChat format ["map: %1", _notifHashMap];
	DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Client: List %1 changed. Updated hashmap is: %2", _changedList, _notifHashMap);

	private _changedListContents = _notifHashMap get _changedList;
	if (isNil "_changedListContents") exitWith {
		DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Client: Could not find list %1 in hashmap %2", _changedList, _notifHashMap);
	};
	
	// Get the array of lists that the user has collapsed
	private _collapsedLists = uiNamespace getVariable [MACRO_VARNAME_COLLAPSED_LISTS, []];

	private _listTree = uiNamespace getVariable MACRO_VARNAME_UI_NOTIFIER_TREE;
	if (isNil "_listTree") exitWith {
		DEBUG_PRINT_LOG("[ZEUS_NOTIFIER] Client: Could not find notifier tree control in uiNamespace!");
	};
	// Locate the index of the changed list in the tree
	private _changedListTreeIndex = -1;
	for "_i" from 0 to ((_listTree tvCount []) - 1) do {
		if ((_listTree tvData [_i]) isEqualTo _changedList) exitWith {
			_changedListTreeIndex = _i;
			DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Found changed list %1 at index %2", _changedList, _i);
		};
	};
	DEBUG_PRINT_LOG("[ZEUS_NOTIFIER] Got out");
	DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] _changedListTreeIndex is %1", _changedListTreeIndex);

	// If the list was visible
	if (_changedListTreeIndex > -1) then  {
		DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Client: List %1 was previously visible.", _changedList);
		
		// If the list has content
		if (count _changedListContents > 0) then {
			// Delete all of the former children of that list
			// Must start at the highest index to not shift positions of elements in the tree
			for "_i" from ((_listTree tvCount [_changedListTreeIndex]) - 1) to 0 step -1 do {
				_listTree tvDelete [_changedListTreeIndex, _i];
			};

			// Add all of the children of the list
			{
				_listTree tvAdd [[_changedListTreeIndex], _x];
			} forEach _changedListContents;
		// If the list has no content
		} else {
			// Remove the changed list
			_listTree tvDelete [[_changedListTreeIndex]];
			DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Client: List %1 was visible but now has no content. Removing.", _changedList);
		};
	// If the list was not visible
	} else {
		// If the list has content (now newly visible)
		if (count _changedListContents > 0) then {
			private _listTitleHashmap = missionNamespace getVariable MACRO_VARNAME_LIST_TITLE_HASHMAP;
			if (isNil "_listTitleHashmap") exitWith {
				DEBUG_PRINT_LOG("[ZEUS_NOTIFIER] Client: Could not find list title hashmap!");
			};

			// Find the list's title
			private _listTitle = _listTitleHashmap get _changedList;
			if (isNil "_listTitle") exitWith {
				DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Client: Could not find title for list %1", _listTitle);
			};

			// Add the list with text of its title data of its name
			private _changedListTreeIndex = _listTree tvAdd [[], _listTitle];
			_listTree tvSetData [[_changedListTreeIndex], _changedList];
			_listTree tvExpand [_changedListTreeIndex];

			// Add the contents of the list to the tree
			{
				_listTree tvAdd [[_changedListTreeIndex], _x];
			} forEach _changedListContents;
			DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Client: List %1 was not previously visible. Added to tree.", _changedList);
		// If the list does not have content
		} else {
			DEBUG_FORMAT1_LOG("[ZEUS_NOIFIER] Client: Received changed list %1 with no content but the list was not visible.", _changedList);
		};
	};
};