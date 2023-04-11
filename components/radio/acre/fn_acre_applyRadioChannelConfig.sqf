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

private _unvisitedConfigs = +_channelConfig;
private _defaultPreset = [side group player] call f_fnc_acre_getPresetForSide;

{	
	private _radio = _x;
	private _index = _unvisitedConfigs findIf {[_radio, _x#0] call acre_api_fnc_isKindOf};
	private _config = _unvisitedConfigs param [_index, []];
	
	if (_config isNotEqualTo []) then
	{
		_config params ["_radioName", "_channelName", ["_preset", _defaultPreset]];	
		
		private _netType = f_map_radioTypes getOrDefault [_radioName, ""];
		private _radioKey = format ["%1::%2", _preset, toUpper _netType];
		private _radiosEntry = f_map_radioChannels getOrDefault [_radioKey, [_preset, _netType, []]];
		
		private _channelList = _radiosEntry#2;
		private _channelIndex = switch (typeName _channelName) do 
		{
			case "SCALAR": 
			{
				_channelName
			};
			case "STRING": 
			{				
				private _index = _channelList find (_channelName);
				(_index + 1) max 1
			};
			default 
			{
				throw format ["Invalid channel name %1 (type %2)", _channelName, typeName _channelName];
			};
		};

		[_radio, _channelIndex] call acre_api_fnc_setRadioChannel;
		_unvisitedConfigs deleteAt _index;
	};

} foreach _unitRadios;