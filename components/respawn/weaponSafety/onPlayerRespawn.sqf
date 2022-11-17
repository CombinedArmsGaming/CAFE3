#include "macros.hpp"

/*
	CAFE weapon safety onRespawn script.

	Prevent weapon discharge upon spawn by putting weapon on safety.
*/

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

private _usingRespawnUI = [RESPAWN_MENU] call f_fnc_isRespawnModeActive;

if !(_usingRespawnUI) exitWith
{
	DEBUG_PRINT_CHAT("[RESPAWN-2]: Not using the respawn UI, skipping weaponSafety.")
};

DEBUG_FORMAT2_CHAT("[RESPAWN-2]: Instating safety for unit %1 until fully respawned.", _oldUnit, (group _oldUnit))

_newUnit setVariable ["f_var_spawn_weaponSafety", true];

f_fnc_spawn_disableWeaponSafetiesWithDelayWhenRespawnMenuClosed = 
{
	// Wait until respawn screen is no longer displayed.
	[
		{		
			!((missionNamespace getVariable ["BIS_RscRespawnControlsMap_shown", false]) or (missionNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false]))
		},
	
		{			
			// Take all weapons off safety 1 sec later.
			[
				{
					private _unit = _this#0;
					DEBUG_FORMAT1_CHAT("[SpawnWeaponSafety]: Safety off for unit %1",_unit)

					_unit setVariable ["f_var_spawn_weaponSafety", false];
					private _safedWeapons = _unit getVariable ["f_arr_safedWeaponMuzzles", []];

					{
						([_unit] + _x) call ace_safemode_fnc_unlockSafety;
					} foreach _safedWeapons;
				},
				_this,
				1	
			] call CBA_fnc_waitAndExecute;
		},
		_this	
	] call CBA_fnc_waitUntilAndExecute;
};


// Wait until respawn manu has been opened, then wait for it to close.
[
	{
		(missionNamespace getVariable ["BIS_RscRespawnControlsMap_shown", false]) or (missionNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false])
	},

	f_fnc_spawn_disableWeaponSafetiesWithDelayWhenRespawnMenuClosed,
	[_newUnit],

	// Timeout (secs)
	1,
	f_fnc_spawn_disableWeaponSafetiesWithDelayWhenRespawnMenuClosed

] call CBA_fnc_waitUntilAndExecute;


f_fnc_spawn_weaponsafety_pollMuzzlesLoop =
{
	// Wait until new muzzle, then put it on safety.
	[
		{
			params ["_unit", "_priorMuzzles"];
			
			private _muzzleKey = format ["%1::%2", currentWeapon _unit, currentMuzzle _unit];
			private _safetyActive = _unit getVariable ["f_var_spawn_weaponSafety", false];

			!(_safetyActive and {_muzzleKey in _priorMuzzles})
		},
		
		{
			params ["_unit", "_priorMuzzles"];

			private _safetyActive = _unit getVariable ["f_var_spawn_weaponSafety", false];
			if !(_safetyActive) exitWith {};

			private _weapon = currentWeapon _unit;
			private _muzzle = currentMuzzle _unit;

			[_unit, _weapon, _muzzle] call ace_safemode_fnc_lockSafety;

			private _muzzleKey = format ["%1::%2", _weapon, _muzzle];
			_priorMuzzles pushBack _muzzleKey;
			
			(_unit getVariable "f_arr_safedWeaponMuzzles") pushBack [_weapon, _muzzle];

			DEBUG_FORMAT1_CHAT("[SpawnWeaponSafety]: Safety on for %1",_muzzleKey)

			_this call f_fnc_spawn_weaponsafety_pollMuzzlesLoop;
		},
		
		_this

	] call CBA_fnc_waitUntilAndExecute;
};

if ((_newUnit getVariable ["f_arr_safedWeaponMuzzles", []]) isEqualTo []) then
{
	_newUnit setVariable ["f_arr_safedWeaponMuzzles", []];
};

[_newUnit, []] call f_fnc_spawn_weaponsafety_pollMuzzlesLoop;