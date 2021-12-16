/* --------------------------------------------------------------------------------------------------------------------
	Author:		Cre8or
	Description:
		Handles the Ceasefire UI.

		No functions impacting gameplay or mission flow shall be performed here.
		NOTE: The appearance of the UI depends on external variables, such as the countdown duration.
	Arguments:
		0:      <BOOLEAN>	Whether or not the UI should be displayed (optional, default: true)
		1:	<BOOLEAN>	Whether or not the countdown should be visible (optional, default: true)
		2:	<STRING>	The description text to be displayed on the UI (optional, default: "")
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */

#include "config\macros.hpp"

// Fetch our params
params [
	["_enabled", true, [true]],
	["_showCountdown", true, [true]],
	["_description", "", [""]]
];

if (!_enabled) exitWith {
	"CAFE_RscCeasefire" cutRsc ["Default", "PLAIN"];
};





// Initialise the UI
private _UI = uiNamespace getVariable ["CAFE_RscCeasefire", displayNull];

if (isNull _UI) then {
	"CAFE_RscCeasefire" cutRsc ["CAFE_RscCeasefire", "PLAIN"];
	_UI = uiNamespace getVariable ["CAFE_RscCeasefire", displayNull];

	// Set the pixel precision mode on some controls
	(_UI displayCtrl MACRO_IDC_CF_OUTLINE) ctrlSetPixelPrecision 2
};

(_UI displayCtrl MACRO_IDC_CF_COUNTDOWN) ctrlShow _showCountdown;
(_UI displayCtrl MACRO_IDC_CF_DESCRIPTION) ctrlSetText _description;





// Continuously update the UI
if (isNil "cafe_fc_drawEH") then {cafe_fc_drawEH = -1};

if (cafe_fc_drawEH >= 0) then {
	removeMissionEventHandler ["Draw3D", cafe_fc_drawEH];
};
cafe_fc_drawEH = addMissionEventHandler ["Draw3D", {

	private _UI = uiNamespace getVariable ["CAFE_RscCeasefire", displayNull];
	private _ctrlCountdown = _UI displayCtrl MACRO_IDC_CF_COUNTDOWN;

	private _countdown = missionNamespace getVariable ["cafe_cf_countdown", 0];
	private _delay = ((_countdown - CBA_missionTime) min 5999) max 0;

	private _seconds = floor (_delay mod 60);
	private _minutes = floor (_delay / 60);

	_strMinutes = str (100 + _minutes) select [1, 2];
	_strSeconds = str (100 + _seconds) select [1, 2];

	_ctrlCountdown ctrlSetText format ["%1:%2", _strMinutes, _strSeconds];

	if (_delay < 10) then {
		_ctrlCountdown ctrlSetTextColor SQUARE(MACRO_COLOUR_A100_RED);
	} else {
		_ctrlCountdown ctrlSetTextColor SQUARE(MACRO_COLOUR_A100_WHITE);
	};

}];
