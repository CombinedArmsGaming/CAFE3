#include "macros.hpp"

/*
    Heal all wounds for ACE3 (as of 2021-09-02), by Bubbus

    Given any unit:
        * Heals random wounds on the unit until:
            * No more wounds remain, or
            * The limit specified by _woundsToHeal is reached (default value: 10).

    This function uses threshold values from ACE medical, which may be subject to change.
    If ACE medical has changed sunstantially since this function was written, it may no longer work properly.

 */

// These macros are from ACE itself, with minor adjustments to work here.
// Duplicating macros instead of importing ACE macro file, so if the ACE macro file moves in a future medical rewrite, it doesn't crash Arma here.
#define BLOOD_LOSS_KNOCK_OUT_THRESHOLD  ace_medical_const_bloodLossKnockOutThreshold
#define VAR_OPEN_WOUNDS                 ace_medical_openWounds
#define VAR_BODY_PART_DAMAGE            ace_medical_bodyPartDamage
#define VAR_WOUND_BLEEDING              ace_medical_woundBleeding
#define ALL_BODY_PARTS                  ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]

params [
	["_unit", objNull, [objNull]],
	["_woundsToHeal", 10, [0]],
	["_healUntilBleedRateNotCritical", false, [false]]
];

RUN_LOCAL_TO(_unit,f_fnc_healWounds,_this);

private _openWounds = _unit getVariable [STRING(VAR_OPEN_WOUNDS), createHashMap];
private _woundsQueue = [];
private _allBodyPartDamages = _unit getVariable [STRING(VAR_BODY_PART_DAMAGE), [0,0,0,0,0,0]];
private _sortedWounds = [];
private _bleedRate = _unit getVariable [STRING(VAR_WOUND_BLEEDING), 0];
private ["_bodyPart", "_bodyPartWounds", "_score"];

scopeName "f_fnc_healWounds_main";

// Get all open wounds
{
	_bodyPart = _x;
	_bodyPartWounds = _openWounds getOrDefault [_x, []];

	{
		_x params ["", "_amount", "_bleeding", "_damage"];

		// When only fixing wounds until the unit's bleeding becomes non-critical, we have to do
		// some extra work, like estimating the total bleeding rate, and early exiting.
		if (_healUntilBleedRateNotCritical) then {

			// This is not the exact criteria ACE uses to allow wake-up, but it's pretty close.
			if (_bleedRate < (BLOOD_LOSS_KNOCK_OUT_THRESHOLD / 2) - 0.005) then {
    				DEBUG_FORMAT2_LOG("[HEAL WOUNDS]: Gathered %1 critical wounds to heal (but could have healed %2)",count _sortedWounds,_woundsToHeal)
    				DEBUG_FORMAT2_CHAT("[HEAL WOUNDS]: Gathered %1 critical wounds to heal (but could have healed %2)",count _sortedWounds,_woundsToHeal)

				breakTo "f_fnc_healWounds_main";
			};

			_bleedRate = _bleedRate - _bleeding;
		};

		// Assign a wound "score" (how significant the wound is). Used for array sorting.
		// The formula depends on what the priority for the function is (heal just enough to stop the
		// bleeding rate from being too critical (preventing units to wake up), or heal as many wounds
		// as requested via the parameters).
		if (_healUntilBleedRateNotCritical) then {
			_score = _bleeding;
		} else {
			_score = _amount * _bleeding + 0.25 * _damage;
		};

		_sortedWounds append [[_score] + _x + [_bodyPart]];

	} forEach _bodyPartWounds;
} forEach keys _openWounds;

// If there are no wounds to be healed, exit early
if (_sortedWounds isEqualTo []) exitWith {};

_sortedWounds sort false;

// Remove wounds, starting with the most significant ones
private ["_index", "_wound", "_bodyPartIndex", "_bodyPartDamage"];
for "_i" from 1 to _woundsToHeal min count _sortedWounds do {
	(_sortedWounds # (_i - 1)) params ["", "_classID", "_amount", "_bleeding", "_damage", "_bodyPart"];

	_bodyPartWounds = _openWounds getOrDefault [_bodyPart, []];
	_index = _bodyPartWounds findIf {
		_classID == _x # 0
		and {_bleeding == _x # 2}
		and {_damage == _x # 3}
	};

	// If we found the concerned wound, remove it
	if (_index >= 0) then {
		DEBUG_FORMAT3_LOG("[HEAL WOUNDS]: Removing wound %1 on %2 (iteration %3)...",_index,_bodyPart,_i)
		DEBUG_FORMAT3_CHAT("[HEAL WOUNDS]: Removing wound %1 on %2 (iteration %3)...",_index,_bodyPart,_i)
		_bodyPartWounds deleteAt _index;

		_bodyPartIndex = ALL_BODY_PARTS find _bodyPart;
		_bodyPartDamage = (_allBodyPartDamages param [_bodyPartIndex, 0]) - (_damage * _amount);

		// Prevent obscenely small damage from lack of floating precision
		if (_bodyPartDamage < 0.05) then {
			_allBodyPartDamages set [_bodyPartIndex, 0];
		} else {
			_allBodyPartDamages set [_bodyPartIndex, _bodyPartDamage];
		};

		_openWounds set [_bodyPart, _bodyPartWounds];
	};
};

_unit setVariable [STRING(VAR_OPEN_WOUNDS), _openWounds, true];
_unit setVariable [STRING(VAR_BODY_PART_DAMAGE), _allBodyPartDamages, true];

[_unit] call ace_medical_status_fnc_updateWoundBloodLoss;
[_unit] call ace_medical_engine_fnc_updateDamageEffects;
[_unit, true, true, true, true] call ace_medical_engine_fnc_updateBodyPartVisuals;
