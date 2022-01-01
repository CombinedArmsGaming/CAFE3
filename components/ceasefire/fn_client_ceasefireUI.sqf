/* --------------------------------------------------------------------------------------------------------------------
	Author:		Cre8or
	Description:
		Handles the Ceasefire UI on the client.
		Initiated by fn_ceasefire.

		A negative timestamp indicates that the countdown shall not be shown.
		No functions impacting gameplay or mission flow are performed here.
	Arguments:
		0:      <BOOLEAN>	Whether or not the UI should be displayed (optional, default: true)
		1:	<NUMBER>	Timestamp for when the ceasefire should end (optional, default: -1)
		2:	<STRING>	Justification for the ceasefire (e.g. "Tech issues") (optional, default: "")
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */

#include "config\macros.hpp"

// Fetch our params
params [
	["_enabled", true, [true]],
	["_endTime", -1, [-1]],
	["_justification", "", [""]]
];

// If this function is not executing on a player machine, exit
if (!hasInterface) exitWith {};

private _UI = uiNamespace getVariable ["CAFE_RscCeasefire", displayNull];

if (!_enabled) exitWith {
	"CAFE_RscCeasefire" cutFadeOut 0;

	// Play an exit sound if the UI was open
	if (!isNull _UI) then {
		playSound "HintCollapse";
	};
};





// Initialise the UI
if (isNull _UI) then {
	"CAFE_RscCeasefire" cutRsc ["CAFE_RscCeasefire", "PLAIN"];
	_UI = uiNamespace getVariable ["CAFE_RscCeasefire", displayNull];

	_UI setVariable ["startTime", CBA_missionTime];
	playSound "HintExpand"
};

(_UI displayCtrl MACRO_IDC_CF_COUNTDOWN) ctrlShow (_endTime >= 0);
(_UI displayCtrl MACRO_IDC_CF_DESCRIPTION) ctrlSetText _justification;

_UI setVariable ["endTime", _endTime];





// Continuously update the UI
if (isNil "cafe_ceasefire_client_UI_EH") then {cafe_ceasefire_client_UI_EH = -1};

removeMissionEventHandler ["Draw3D", cafe_ceasefire_client_UI_EH];
cafe_ceasefire_client_UI_EH = addMissionEventHandler ["Draw3D", {

	private _UI = uiNamespace getVariable ["CAFE_RscCeasefire", displayNull];
	private _ctrlGroup = _UI displayCtrl MACRO_IDC_CF_CTRLGROUP;
	private _endTime = _UI getVariable ["endTime", 0];

	// Update the countdown
	if (_endTime >= 0) then {
		private _ctrlCountdown = _UI displayCtrl MACRO_IDC_CF_COUNTDOWN;
		private _countdown = ((_endTime - CBA_missionTime) min 5999) max 0;

		private _seconds = floor (_countdown mod 60);
		private _minutes = floor (_countdown / 60);

		_strMinutes = str (100 + _minutes) select [1, 2];
		_strSeconds = str (100 + _seconds) select [1, 2];

		_ctrlCountdown ctrlSetText format ["%1:%2", _strMinutes, _strSeconds];

		if (_countdown < 10) then {
			_ctrlCountdown ctrlSetTextColor SQUARE(MACRO_COLOUR_A100_RED);

			// Play a sound on every passing second
			private _secondsPrev = _UI getVariable ["secondsPrev", 0];
			if (_seconds != _secondsPrev) then {
				playSound "readoutClick";

				_UI setVariable ["secondsPrev", _seconds];
			};
		} else {
			_ctrlCountdown ctrlSetTextColor SQUARE(MACRO_COLOUR_A100_WHITE);
		};
	};

	private _startTime = _UI getVariable ["startTime", 0];
	private _easeIn = ((_startTime - CBA_missionTime) * 2 + 1) max 0;
	private _cam = missionnamespace getvariable ["BIS_fnc_camera_cam",objnull];
	private _pos = ctrlPosition _ctrlGroup;

	// Hide the ceasefire UI while using the debug camera (useful for screenshots)
	if (alive _cam) then {
		_pos set [1, safeZoneY - MACRO_POS_CF_HEIGHT * safeZoneW];

	// Otherwise, offset the ceasefire UI if the Zeus interface is open (prevents overlapping)
	} else {
		private _zeusUI = findDisplay 312;

		if (isNull _zeusUI) then {
			_pos set [1, safeZoneY - MACRO_POS_CF_HEIGHT * safeZoneW * _easeIn];
		} else {
			_pos set [1, safeZoneY + safeZoneH - MACRO_POS_CF_HEIGHT * safeZoneW];
		};
	};

	_ctrlGroup ctrlSetPosition _pos;
	_ctrlGroup ctrlCommit 0;
}];
