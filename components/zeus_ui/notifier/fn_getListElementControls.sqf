/* --------------------------------------------------------------------------------------------------------------------
	Author:		Emma
	Description:
		Function which creates the extra controls for each element in a list. 
		Sizes correctly but does not position the group.
	Arguments:
		0:	<OBJECT>	Unit on list
		1:	<STRING>	Name of list
	Returns:
		0:	<ARRAY>
			0:	<Control Group>		Control group containing the necessary controls
			1:	<NUMBER>			Width of the control group
-------------------------------------------------------------------------------------------------------------------- */
#include "macros.hpp"
params ["_unit", "_listName"];

private _zeusUI = findDisplay 312;

private _createCtrl = {
	params ["_class", "_idc", "_x", "_y", "_w", "_h", ["_ctrlGrp", controlNull]];
	private _ctrl = controlNull;
	private _additionalCtrls = [];

	switch (toLower _class) do {
		case "controlsgroup": {
			_ctrl = _zeusUI ctrlCreate ["RscControlsGroup", _idc, _ctrlGrp];
			_ctrl ctrlSetPixelPrecision 2;
		};
		case "text": {
			_ctrl = _zeusUI ctrlCreate ["CA_ZeusUI_ScriptedText", _idc, _ctrlGrp];
			_ctrl ctrlSetText (_this select 7);
			_ctrl ctrlSetTextColor SQUARE(MACRO_COLOUR_WHITE_TEXT);
		};
		case "button": {
			private _suffix = "";
			if (_this param [8, ""] != "") then {
				_suffix = format ["_%1", _this select 8];
			};

			_ctrl = _zeusUI ctrlCreate [format ["CA_ZeusUI_ScriptedButton%1", _suffix], _idc, _ctrlGrp];
			_ctrl ctrlSetText (_this select 7);
		};
		case "picturebutton": {
			_ctrl = _zeusUI ctrlCreate ["CA_ZeusUI_ScriptedPictureButton", _idc, _ctrlGrp];
			_ctrl ctrlSetText (_this select 7);
		};
	};

	// If the new control is a child of a controls group, add it to its child controls list
	if (!isNull _ctrlGrp) then {
		private _childControls = _ctrlGrp getVariable [MACRO_VARNAME_UI_CHILDCONTROLS, []];
		_childControls append _additionalCtrls;
		_childControls pushBack _ctrl;
		_ctrlGrp setVariable [MACRO_VARNAME_UI_CHILDCONTROLS, _childControls];
	};

	// Position and scale the control
	_ctrl ctrlSetPosition [_x, _y, _w, _h];
	_ctrl ctrlCommit 0;

	// Return the new control
	_ctrl;
};

private _useElement = {
	params ["_element", "_unit"];
	switch (_element) do {
		case "immRespawnButton": {
			private _immediateRespawnButton = [
				"picturebutton",
				MACRO_IDC_NOTIFIER_IMM_RESPAWN_BUTTON,
				0,
				0,
				safeZoneH * MACRO_POS_TEXT_HEIGHT,
				safeZoneH * MACRO_POS_TEXT_HEIGHT,
				_ctrlGrp,
				"A3\ui_f\data\IGUI\Cfg\Actions\settimer_ca.paa"
			] call _createCtrl;

			_immediateRespawnButton ctrlSetTooltip "Allow immediate respawn";
			_immediateRespawnButton setVariable ["unit", _unit];
			_immediateRespawnButton ctrlAddEventHandler ["ButtonClick", {
				params ["_control"];
				private _unit = _control getVariable ["unit", objNull];
				systemChat format ["unit %1 control %2", _unit, _control];
				if (_unit isNotEqualTo objNull) then {
					[] remoteExec ["f_fnc_allowImmediateRespawnLocal", _unit];
					systemChat "respawning";
					["respawning"] remoteExec ["systemChat", _unit];
				};
			}];
			_immediateRespawnButton;
		};

		case "respawnSquareButton": {
			private _respawnOnSquareButton = [
				"picturebutton",
				MACRO_IDC_NOTIFIER_RESPAWN_SQUARE_BUTTON,
				safeZoneH * MACRO_POS_TEXT_HEIGHT,
				0,
				safeZoneH * MACRO_POS_TEXT_HEIGHT,
				safeZoneH * MACRO_POS_TEXT_HEIGHT,
				_ctrlGrp,
				"A3\ui_f\data\IGUI\Cfg\Actions\loadVehicle_ca.paa"
			] call _createCtrl;
			_respawnOnSquareButton ctrlSetTooltip "Respawn on mouse click";
		};
	};
};

#define USE_ELEMENT(elmt) [QUOTE(elmt), _unit] call _useElement

private _ctrlGrp = [
	"controlsgroup",
	-1,
	0,
	0,
	0,
	safeZoneH * MACRO_POS_TEXT_HEIGHT
] call _createCtrl;


switch (_listName) do {
	case (NOTIFIER_LIST_DEAD_PLAYERS # 0): {
		USE_ELEMENT(immRespawnButton);
		USE_ELEMENT(respawnSquareButton);
		_ctrlGrp ctrlSetPositionW (safeZoneW * MACRO_POS_TEXT_HEIGHT * 2);
		_ctrlGrp ctrlCommit 0;
		_ctrlGrp;
	};
	default {
		controlNull;
	};
};