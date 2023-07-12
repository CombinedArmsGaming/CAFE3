#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_createLoadoutLocker);

params ["_locker", "_faction"];

WAIT_UNTIL_MISSION_STARTED();
waitUntil { IS_TRUE(f_var_gearscript_loaded) };

if (_locker getVariable ["f_var_isLoadoutLocker", false] isEqualTo true) exitWith {};

_gearVariant = [_faction] call f_fnc_factionToSideName;

if (_gearVariant isEqualTo "") exitWith {};

if (IS_PLAYER) then
{
	_registry = LOADOUT_REGISTRY_DYNAMIC(_gearVariant);

	if (_registry isEqualTo []) exitWith {};

	_codeTemplate = "['%1', (_this select 1), '%2'] call f_fnc_assignGear;";

	// Add the base ACE3 category
	[
		_locker,
		0,
		[],
		[
			"cafe3_takeLoadout",
			"Take Loadout",
			"",
			{},
			{true}
		] call ace_interact_menu_fnc_createAction
	] call ace_interact_menu_fnc_addActionToObject;

	{
		_xCaps = toUpper _x;

		if !(_xCaps isEqualTo "DEFAULT") then
		{
			_condition = "!(_this getVariable ['f_var_assignGear_running', false])";

			if (_xCaps isEqualTo "ZEUS") then
			{
				_condition = "!((_this getVariable ['f_var_assignGear_running', false]) or {!(_this getVariable ['f_var_isZeus', false])})";
			};

			_locker addAction
			[
				format ["<t color='#999999'>Take loadout:</t> <t color='#ff8800'>%1</t>", _xCaps],
				format [_codeTemplate, _x, _faction],
				nil,
				1.5,
				false,
				true,
				"",
				_condition,
				5
			];

			[
				_locker,
				0,
				["cafe3_takeLoadout"],
				[
					format ["cafe3_takeLoadout_%1", _xCaps],
					_xCaps,
					"",
					compile format ["_this = [_target, _player];" + _codeTemplate, _x, _faction],
					compile ("_this = _player;" + _condition)
				] call ace_interact_menu_fnc_createAction
			] call ace_interact_menu_fnc_addActionToObject;
		};

	} forEach _registry;

};

_locker setVariable ["f_var_isLoadoutLocker", true];

_bagType = switch (_gearVariant) do
{
	case "blufor":    {"Land_TentSolar_01_folded_bluewhite_F"};
	case "opfor":     {"Land_TentSolar_01_folded_redwhite_F"};
	case "indfor":    {"Land_TentSolar_01_folded_olive_F"};
	case "guerrilla": {"Land_TentSolar_01_folded_olive_F"};
	case "civilian":  {"Land_TentSolar_01_folded_sand_F"};
	default           {"RoadCone_L_F"};
};

private _lockerBag = _bagType createVehicleLocal [0,0,0];
private _lockerHeightTop = (0 boundingBoxReal _locker) # 1 # 2;
private _bagHeightBottom = (0 boundingBoxReal _lockerBag) # 0 # 2;

_lockerBag attachTo [_locker, [0,0,_lockerHeightTop - _bagHeightBottom]];
_locker setVariable ["f_var_lockerBag", _lockerBag, false];

_locker addEventHandler ["Deleted",
	{
		params ["_locker"];

		deleteVehicle (_locker getVariable ["f_var_lockerBag", objNull]);
	}
];
