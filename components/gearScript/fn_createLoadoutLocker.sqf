#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_createLoadoutLocker);

params ["_locker", "_faction"];

_locker lockInventory true;

WAIT_UNTIL_MISSION_STARTED();
waitUntil { IS_TRUE(f_var_gearscript_loaded) };

if (_locker getVariable ["f_var_isLoadoutLocker", false] isEqualTo true) exitWith {};

_gearVariant = [_faction] call f_fnc_factionToSideName;

if (_gearVariant isEqualTo "") exitWith {};

if (IS_PLAYER) then
{
	_registry = LOADOUT_REGISTRY_DYNAMIC(_gearVariant);

	if (_registry isEqualTo []) exitWith {};

	_locker addAction
	[
		"Open Loadout Menu",
		{
			// Elements 0 1 and 2 of the arguments are from addAction, 3 is _faction
			player setVariable ["f_var_interactedLockerFaction", _this # 3];
			createDialog "CAFE_LoadoutPicker_Dialog";
		},
		_faction,
		1.5,
		true, // Show title text when approaching
		true,
		"",
		"!(_this getVariable ['f_var_assignGear_running', false])",
		5
	];

	// Add the ACE3 interaction
	[
		_locker,
		0,
		[],
		[
			"cafe3_takeLoadout",
			"Open Loadout Menu",
			"",
			{
				// # 2 selects the optional args, and then # 0 gets _faction out of them
				player setVariable ["f_var_interactedLockerFaction", (_this # 2) # 0];
				createDialog "CAFE_LoadoutPicker_Dialog";
			},
			{!(player getVariable ['f_var_assignGear_running', false])},
			{},
			[_faction]
		] call ace_interact_menu_fnc_createAction
	] call ace_interact_menu_fnc_addActionToObject;
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
