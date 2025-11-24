// Stopped dragging the frame
case "ui_dragging_stop": {
	_eventExists = true;

	// Fetch our params
	_args params ["_ctrl", "_button"];

	// Fetch our dragged control, either main or notifier depending on which was being dragged
	private _ctrl = _zeusUI_mainCtrlGrp controlsGroupCtrl MACRO_IDC_MAIN_DRAGGING_FRAME;
	private _ctrlGrp = _zeusUI_mainCtrlGrp;
	private _ctrlGrpPosVarName = MACRO_VARNAME_UI_POS_MAINCTRLGRP;
	if (!(_ctrl getVariable [MACRO_VARNAME_UI_ISBEINGDRAGGED, false])) then {
		_ctrl = _zeusUI_notifierCtrlGrp controlsGroupCtrl MACRO_IDC_NOTIFIER_DRAGGING_FRAME;
		_ctrlGrp = _zeusUI_notifierCtrlGrp;
		_ctrlGrpPosVarName = MACRO_VARNAME_UI_POS_NOTIFIERCTRLGRP;
	};

	// Only detect left clicks
	if (_button == 0 and {_ctrl getVariable [MACRO_VARNAME_UI_ISBEINGDRAGGED, false]}) then {

		// Mark the control as no longer being dragged
		_ctrl setVariable [MACRO_VARNAME_UI_ISBEINGDRAGGED, false];

		// Save the new UI position in the profile namespace
		(ctrlPosition _ctrlGrp) params ["_posX", "_posY"];
		profileNamespace setVariable [_ctrlGrpPosVarName, [_posX, _posY]];
		saveProfileNamespace;

		// Remove the dragging event handlers
		_zeusUI displayRemoveEventHandler ["MouseMoving", _ctrlGrp getVariable [MACRO_VARNAME_UI_DRAGGING_EH, -1]];
		_zeusUI displayRemoveEventHandler ["MouseButtonUp", _ctrlGrp getVariable [MACRO_VARNAME_UI_DRAGGING_STOP_EH, -1]];

		// If the presets menu is shown, reposition it
		if (missionNamespace getVariable [MACRO_VARNAME_UI_PRESETS_ISSHOWN, false]) then {
			["ui_init", [MACRO_VARNAME_UI_ID_PRESETS]] call f_fnc_zeusUI;
		};
	};
};
