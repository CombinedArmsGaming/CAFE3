// Dragging the frame
case "ui_dragging": {
	_eventExists = true;

	// Fetch our dragged control
	private _ctrl = _zeusUI_mainCtrlGrp controlsGroupCtrl MACRO_IDC_MAIN_DRAGGING_FRAME;
	if (!(_ctrl getVariable [MACRO_VARNAME_UI_ISBEINGDRAGGED, false])) then {
		_ctrl = _zeusUI_notifierCtrlGrp controlsGroupCtrl MACRO_IDC_NOTIFIER_DRAGGING_FRAME;
	};
	private _ctrlGrp = ctrlParentControlsGroup _ctrl;

	// Only continue if the control is still being dragged
	if (_ctrl getVariable [MACRO_VARNAME_UI_ISBEINGDRAGGED, false]) then {

		// Fetch our mouse position
		getMousePosition params ["_posX", "_posY"];

		// Fetch our position offset
		(_ctrlGrp getVariable [MACRO_VARNAME_UI_MOUSEOFFSET, [0, 0]]) params ["_offsetX", "_offsetY"];

		// Reposition our main UI's controls group
		private _pos = ctrlPosition _ctrlGrp;
		_pos set [0, _posX - _offsetX];
		_pos set [1, _posY - _offsetY];
		_ctrlGrp ctrlSetPosition _pos;
		_ctrlGrp ctrlCommit 0;
	};
};
