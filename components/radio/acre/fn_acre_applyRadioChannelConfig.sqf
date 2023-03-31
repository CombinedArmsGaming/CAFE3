#include "macros.hpp"

// ACRE integration for CAFE, by Bubbus
// Set all radios a unit has to the channels defined by the given channel config.

params ["_unit", "_channelConfig"];

if !(isPlayer _unit) exitWith {};

if !([] call acre_api_fnc_isInitialized) exitWith
{
	[
		{
			[] call acre_api_fnc_isInitialized
		},
		f_fnc_acre_applyRadioChannelConfig,
		_this
	] call CBA_fnc_waitUntilAndExecute;
};

DEBUG_FORMAT1_LOG("[RADIO-2] Configuring radio channels for player '%1'.",_unit)

private _unitRadios = [_unit] call f_fnc_acre_getAllRadiosForUnit;

diag_log format ["[SETRDO1] %1", _unitRadios];

private _unvisitedConfigs = +_channelConfig;

diag_log format ["[SETRDO2] %1", _unvisitedConfigs];

{
	private _radio = _x;
	private _index = _unvisitedConfigs findIf {[_radio, _x#0] call acre_api_fnc_isKindOf};
	private _config = _unvisitedConfigs param [_index, []];

	diag_log format ["[SETRDO3] %1, %2", _radio, _config];

	if (_config isNotEqualTo []) then
	{
		private _channelList = f_map_acre_radioNameChannelMap getOrDefault [_config#0, []];
		private _channelIndex = _channelList find (_config#1);
		_channelIndex = (_channelIndex + 1) max 1;

		diag_log format ["[SETRDO4] %1, %2", _radio, _channelIndex];

		[_radio, _channelIndex] call acre_api_fnc_setRadioChannel;
		_unvisitedConfigs deleteAt _index;

		diag_log format ["[SETRDO5] %1", _unvisitedConfigs];
	};

} foreach _unitRadios;