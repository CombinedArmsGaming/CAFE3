/* 
	Adjusts zeus notifier UI based on collapse state

	Arguments:
		0: <CONTROL> The button control for the toggle collapse button
		1: <BOOLEAN> Whether or not the window is *now* collapsed
*/
case "ui_collapse": {
	_eventExists = true;
	_args params ["_button", "_notifierCollapsed"];
	DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Toggling notifier collapse. _notifierCollapsed now: %1", _notifierCollapsed);

	// Change texture of the button
	private _pictureString = if (_notifierCollapsed) then {"A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa"} else {"A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa"};
	_button ctrlSetText _pictureString;

	// Get the relevant controls 
	private _notifierBackground = _zeusUI displayCtrl MACRO_IDC_NOTIFIER_BACKGROUND;
	private _notifierBackgroundOutline = _zeusUI displayCtrl MACRO_IDC_NOTIFIER_BACKGROUND_OUTLINE;

	// Set the control height based on if the window is collapsed or expanded
	private _newHeight = safeZoneH * MACRO_POS_NOTIFIER_HEIGHT;
	if (_notifierCollapsed) then {
		_newHeight = safeZoneH * MACRO_POS_NOTIFIER_GAP_DRAGGING_Y;
	};

	{
		_x ctrlSetPositionH _newHeight;
		_x ctrlCommit 0;
	} forEach [_notifierBackground, _notifierBackgroundOutline];
	
	// Hide the outline when the window is collapsed
	_notifierBackgroundOutline ctrlShow !_notifierCollapsed;
	
	// Show the tree if the notifier is not collapsed, or hide it if it is
	private _listTree = _zeusUI displayCtrl MACRO_IDC_NOTIFIER_TREE;
	_listTree ctrlShow !_notifierCollapsed;
};