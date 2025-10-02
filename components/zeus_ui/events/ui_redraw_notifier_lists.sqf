case "ui_redraw_notifier_lists": {
	_eventExists = true;

	// Draw the lists based on the visible lists array
	// Position correctly based on collapsed status and lines of content
	// Does not create any controls, just positions them

	private _notifHashMap = missionNamespace getVariable [MACRO_VARNAME_NOTIFIER_MAP, false];
	// Collapsed lists is an array with elements that are the string name of lists
	private _collapsedLists = uiNamespace getVariable [MACRO_VARNAME_COLLAPSED_LISTS, []];
	// Visible lists is an array with elements [name of list, lines of content]
	private _visibleLists = uiNamespace getVariable [MACRO_VARNAME_UI_VISIBLE_LISTS, []];
	
	DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Redrawing lists! Visible lists: %1", _visibleLists);

	private _listCtrlGrpHashmap = uiNamespace getVariable MACRO_VARNAME_UI_LIST_CTRLGRPS;

	private _currentLine = 0;
	{
		private _listName = _x # 0;
		private _linesOfContent = _x # 1;
		private _listIsCollapsed = _listName in _collapsedLists;
		private _animDuration = 0.1;
		// Position the list control group
		private _listCtrlGrp = _listCtrlGrpHashmap get _listName;
		// The control group always has 1 line for the title, and might have the content lines, if it is not collapsed
		private _ctrlGrpLinesTall = if (_listIsCollapsed) then {1} else {1 + _linesOfContent};
		_listCtrlGrp ctrlSetPosition [0, _currentLine * safeZoneH * MACRO_POS_TEXT_HEIGHT, safeZoneW * MACRO_POS_NOTIFIER_WIDTH, safeZoneH * _ctrlGrpLinesTall * MACRO_POS_TEXT_HEIGHT];
		_listCtrlGrp ctrlCommit _animDuration;
		DEBUG_FORMAT3_LOG("[ZEUS_NOTIFIER] Placing list %1. Current line: %2. Lines of content: %3", _listName, _currentLine, _linesOfContent);

		if (!_listIsCollapsed) then {
			// Position the list contents
			private _listContentControls = _listCtrlGrp getVariable [MACRO_VARNAME_UI_NOTIFIER_LIST_CONTENTS, []];
			if (count _listContentControls > 0) then {
				private _textCtrl = _listContentControls # 0;
				// Place the contents below the list title
				_textCtrl ctrlSetPosition [0, safeZoneH * MACRO_POS_TEXT_HEIGHT, safeZoneW * MACRO_POS_NOTIFIER_WIDTH, safeZoneH * (_linesOfContent) * MACRO_POS_TEXT_HEIGHT];
				_textCtrl ctrlCommit 0;
			};
		} else {
			private _listContentControls = _listCtrlGrp getVariable [MACRO_VARNAME_UI_NOTIFIER_LIST_CONTENTS, []];
			if (count _listContentControls > 0) then {
				private _textCtrl = _listContentControls # 0;
				_textCtrl ctrlShow false;
				_textCtrl ctrlSetPosition [0, 0, 0, 0];
				_textCtrl ctrlCommit 0;
			};
		};
	} forEach _visibleLists;
};