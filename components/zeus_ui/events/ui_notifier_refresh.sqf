
case "ui_notifier_refresh": {
	_eventExists = true;
	// Options:
	//		If the changed list has content: Delete and recreate content controls
	//			If the changed list was visible: Edit # of lines of content, recalculate positions if changed list is not collapsed
	// 			If the changed list was not visible: Add to end of visible lists, recalculate positions
	//		If the changed list has no content:
	//			The changed list was not visible: Do nothing
	//			The changed list was visible: Remove from visible lists, delete content controls, hide list control group, recalculate positions

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

	// Visible lists array contains elements [list name, # of lines of content]
	// Should only include lists that are currently visible (have >0 lines of content)
	private _visibleLists = uiNamespace getVariable [MACRO_VARNAME_UI_VISIBLE_LISTS, []];

	private _recalculatePositions = false;

	// Get the control group tied to the list that was changed
	private _listCtrlGrpHashmap = uiNamespace getVariable MACRO_VARNAME_UI_LIST_CTRLGRPS;
	if (isNil "_listCtrlGrpHashmap") exitWith {
		private _str = "[ZEUS_NOTIFIER] Could not get list control group hashmap";
		DEBUG_PRINT_CHAT(_str);
		diag_log _str;
	};

	private _listCtrlGrp = _listCtrlGrpHashmap get _changedList;

	if (isNil "_listCtrlGrp") exitWith {
		DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Client: Could not find control group for list %1. List control group hashmap was: %2", _changedList, _listCtrlGrpHashmap);
	};

	// Delete all the previous list content controls
	{
		ctrlDelete _x;
	} forEach (_listCtrlGrp getVariable [MACRO_VARNAME_UI_NOTIFIER_LIST_CONTENTS, []]);
	_listCtrlGrp setVariable [MACRO_VARNAME_UI_NOTIFIER_LIST_CONTENTS, []];

	// Find the index of the changed list in the visible lists, if it was there
	private _listIdx = (_visibleLists apply {_x # 0}) find _changedList;

	// If the changed list has content
	if (count _changedListContents > 0) then {
		// Make sure the list control group is visible
		_listCtrlGrp ctrlShow true;
	
		// Recreate all of the list content controls
		// {
			// Create a text control
			private _namesString = "";
			{
				_namesString = _x + "<br/>";
			} forEach _changedListContents;

			DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Client: Created control with text %1", _namesString);

			private _ctrl = _zeusUI ctrlCreate ["CA_ZeusUI_ScriptedText", -1, _listCtrlGrp];
			_ctrl ctrlSetText _namesString;
			_ctrl ctrlSetTextColor SQUARE(MACRO_COLOUR_WHITE_TEXT);
			
			private _childControls = _listCtrlGrp getVariable [MACRO_VARNAME_UI_NOTIFIER_LIST_CONTENTS, []];
			_childControls pushBack _ctrl;
			_listCtrlGrp setVariable [MACRO_VARNAME_UI_NOTIFIER_LIST_CONTENTS, _childControls];
			// Create relevant button controls
		// } forEach _changedListContents;

		// If the changed list was visible (first element of elements of _visibleLists is list name)
		private _linesOfContent = count _changedListContents;
		if (_listIdx > -1) then {
			DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Client: List %1 was previously visible. Setting lines of content to %2", _changedList, _linesOfContent);
			_visibleLists set [_listIdx, [_changedList, _linesOfContent]];
			// If the content changed but the list was collapsed, we don't need to recalculate positions
			if (!(_changedList in _collapsedLists)) then {
				_recalculatePositions = true;
			};
		// If the changed list was not visible
		} else {
			_visibleLists pushBack [_changedList, _linesOfContent];
			_recalculatePositions = true;
			DEBUG_FORMAT3_LOG("[ZEUS_NOTIFIER] Client: List %1 was not previously visible. Setting lines of content to %2. Visible lists now: %3", _changedList, _linesOfContent, _visibleLists);
		};
	// If the changed list now has no content
	} else {
		// If the changed list was previously visible
		if (_listIdx > -1) then {
			// Remove the changed list
			_visibleLists deleteAt _listIdx;
			_listCtrlGrp ctrlShow false;
			_recalculatePositions = true;
			DEBUG_FORMAT2_LOG("[ZEUS_NOTIFIER] Client: List %1 was visible but now has no content. Removing. Visible lists now: %2", _changedList, _visibleLists);
		// If the changed list was previously invisible
		} else {
			// Make sure it is hidden 
			_listCtrlGrp ctrlShow false;
			DEBUG_FORMAT1_LOG("[ZEUS_NOIFIER] Client: Received changed list with no content but the list was not visible.");
		};
	};

	uiNamespace setVariable [MACRO_VARNAME_UI_VISIBLE_LISTS, _visibleLists];

	if (_recalculatePositions) then {
		["ui_redraw_notifier_lists"] call f_fnc_zeusUI;
	}
};