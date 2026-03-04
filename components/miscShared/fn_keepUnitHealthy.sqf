#include "macros.hpp"

/*
	fn_keepUnitHealthy
		By Bubbus

	Attempt to keep a unit healthy by detecting potentially fatal conditions and triggering a full ACE heal.
	Runs on a loop, may not provide perfect protection.

	Runs local to the provided unit.  Travels with the unit if locality changes.

	Args:
		_unit (Object, Global)
		Unit to maintain the health of.

	Effect: Global

*/

params ["_unit"];

RUN_LOCAL_TO(_unit,f_fnc_keepUnitHealthy,_this);
RUN_AS_ASYNC(f_fnc_keepUnitHealthy);


// These macros are from ACE itself, with minor adjustments to work here.
// Duplicating macros instead of importing ACE macro file, so if the ACE macro file moves in a future medical rewrite, it doesn't crash Arma here.
#define DEFAULT_BLOOD_VOLUME       6.0
#define VAR_BLOOD_VOL              ace_medical_bloodVolume
#define VAR_WOUND_BLEEDING         ace_medical_woundBleeding
#define GET_BLOOD_VOLUME(unit)     (unit getVariable [STRING(VAR_BLOOD_VOL), DEFAULT_BLOOD_VOLUME])
#define GET_WOUND_BLEEDING(unit)   (unit getVariable [STRING(VAR_WOUND_BLEEDING), 0])

#define IS_UNCONSCIOUS(unit)       (unit getVariable ["ACE_isUnconscious", false])
#define UNIT_IS_HARMED(unit)       (IS_UNCONSCIOUS(unit) or {GET_WOUND_BLEEDING(unit) > 0} or {GET_BLOOD_VOLUME(unit) < DEFAULT_BLOOD_VOLUME})
#define KEEPING_UNIT_HEALTHY(unit) ((_unit getVariable ["f_keepUnitHealthy", false]) isEqualTo true)


if KEEPING_UNIT_HEALTHY(_unit) exitWith {};
_unit setVariable ["f_keepUnitHealthy", true];


while {(local _unit) and {alive _unit} and {KEEPING_UNIT_HEALTHY(_unit)}} do
{
	if UNIT_IS_HARMED(_unit) then
	{
		[_unit] call ace_medical_treatment_fnc_fullHealLocal;
		[_unit, false] call ace_medical_fnc_setUnconscious;
	};
	
	sleep 0.25;

};


private _keepHealthyStillActive = KEEPING_UNIT_HEALTHY(_unit);
_unit setVariable ["f_keepUnitHealthy", false];

if ((alive _unit) and _keepHealthyStillActive) then
{
	RUN_LOCAL_TO(_unit,f_fnc_keepUnitHealthy,_this);
};
