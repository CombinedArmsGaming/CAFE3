#include "macros.hpp"

/*
    Immersive revive for ACE3 (as of 2021-09-01), by Bubbus

    Given an unconscious unit:
        * Takes them out of cardiac arrest.
        * Attempts to alter their vitals so they will reliably wake up and then not fall unconscious again immediately.
        * Wakes then up.

    This function uses threshold values from ACE medical, which may be subject to change.
    If ACE medical has changed sunstantially since this function was written, it may no longer work properly.

 */

#define IS_UNCONSCIOUS(unit)            (((unit) getVariable ["ACE_isUnconscious", false]) and {alive (unit)})

// These macros are from ACE itself, with minor adjustments to work here.
// Duplicating macros instead of importing ACE macro file, so if the ACE macro file moves in a future medical rewrite, it doesn't crash Arma here.
#define BLOOD_VOLUME_CLASS_2_HEMORRHAGE 5.100
#define DEFAULT_BLOOD_VOLUME            6.0
#define DEFAULT_HEART_RATE              80
#define DEFAULT_PERIPH_RES              100
#define BLOOD_LOSS_KNOCK_OUT_THRESHOLD  ace_medical_const_bloodLossKnockOutThreshold
#define VAR_BLOOD_VOL                   ace_medical_bloodVolume
#define VAR_BLOOD_PRESS                 ace_medical_bloodPressure
#define VAR_MEDICATIONS                 ace_medical_medications
#define VAR_WOUND_BLEEDING              ace_medical_woundBleeding
#define VAR_HEMORRHAGE                  ace_medical_hemorrhage
#define VAR_OPEN_WOUNDS                 ace_medical_openWounds
#define VAR_CRDC_ARRST                  ace_medical_inCardiacArrest
#define VAR_HEART_RATE                  ace_medical_heartRate
#define VAR_PERIPH_RES                  ace_medical_peripheralResistance
#define GET_BLOOD_VOLUME(unit)          (unit getVariable [STRING(VAR_BLOOD_VOL), DEFAULT_BLOOD_VOLUME])
#define GET_MEDICATIONS(unit)           (unit getVariable [STRING(VAR_MEDICATIONS),[]])
#define GET_WOUND_BLEEDING(unit)        (unit getVariable [STRING(VAR_WOUND_BLEEDING), 0])
#define GET_OPEN_WOUNDS(unit)           (unit getVariable [STRING(VAR_OPEN_WOUNDS), []])
#define IN_CRDC_ARRST(unit)             (unit getVariable [STRING(VAR_CRDC_ARRST), false])

params ["_unit"];
RUN_LOCAL_TO(_unit,_this,f_fnc_immersiveRevive);

if !IS_UNCONSCIOUS(_unit) exitWith {};

DEBUG_FORMAT1_LOG("[REVIVE]: Attempting to revive unit '%1'...",_unit)

// Following example from ACE's fullHeal function, Need to remove cardiac arrest before anything else.
if IN_CRDC_ARRST(_unit) then
{
    ["ace_medical_CPRSucceeded", _unit] call CBA_fnc_localEvent;
};

// Should only replace missing blood if enough is missing to stop a wake-up (< Class 2 hemorrhage).
private _bloodVolume = GET_BLOOD_VOLUME(_unit);
_bloodVolume = 0 max _bloodVolume min DEFAULT_BLOOD_VOLUME;

private _shouldReplaceBlood = _bloodVolume < BLOOD_VOLUME_CLASS_2_HEMORRHAGE;
private _bloodAmountAfterRevive = _bloodVolume max (BLOOD_VOLUME_CLASS_2_HEMORRHAGE + 0.1);

// Should only reset medications if enough have been taken to put heart rate out of survivable bounds.
// Using heuristics here - multiple active meds of the same type, or if morphine and adenosine have been taken together (dangerous in some conditions).
private _currentMeds = GET_MEDICATIONS(_unit);
private _medsByName = _currentMeds apply {_x#0};
private _medCounts = _medsByName call BIS_fnc_consolidateArray;

private _anyDuplicateMeds = (_medCounts findIf {(_x#1) > 1}) > -1;
private _tookMorphineAndAdenosine = ("Morphine" in _medsByName) and {"Adenosine" in _medsByName};
private _shouldResetMeds = _anyDuplicateMeds or _tookMorphineAndAdenosine;

// Enough info gathered, start reviving unit.
if (_shouldReplaceBlood) then
{
    DEBUG_FORMAT2_LOG("[REVIVE]: Replacing blood: (before: %1, after: %2)",_bloodVolume,_bloodAmountAfterRevive)
    _unit setVariable [STRING(VAR_BLOOD_VOL), _bloodAmountAfterRevive, true];
    _unit setVariable [STRING(VAR_HEMORRHAGE), 3, true];
};

if (_shouldResetMeds) then
{
    DEBUG_FORMAT2_LOG("[REVIVE]: Resetting meds (duplicates: %1, heartstopper combo: %2)",_anyDuplicateMeds,_tookMorphineAndAdenosine)
    _unit setVariable [STRING(VAR_MEDICATIONS), [], true];
};


private "_wounds";
private _removalAttempts = 0;
private _removedWoundBodyParts = [];

// The harder part is to slow down bleeding if the bleed-rate is too high to keep the heart pumping.  We have to heal wounds to do this.
// For some reason, using ACE's bandageLocal function was not working at all so sadly we will delete the wounds instead.
// To protect against this not working somehow, we limit iterations to 10.  If the unit is particularly messed up, this may need to be run a few times.
while
{
    _removalAttempts = _removalAttempts + 1;
    private _bleedRate = GET_WOUND_BLEEDING(_unit) max 0.001;
    DEBUG_FORMAT1_LOG("[REVIVE]: Bleed-rate: %1",_bleedRate)

    // This is not the exact criteria ACE uses to allow wake-up, but it's pretty close.
    private _shouldReduceBleedRate = _bleedRate > ((BLOOD_LOSS_KNOCK_OUT_THRESHOLD / 2) - 0.005);

    _shouldReduceBleedRate and (_removalAttempts <= 10)

}
do
{
    _wounds = GET_OPEN_WOUNDS(_unit);
    private _woundIndexToRemove = floor random count _wounds;
    private _wound = _wounds # _woundIndexToRemove;

    DEBUG_FORMAT2_LOG("[REVIVE]: Removing wound %1 (attempt %2)...",_woundIndexToRemove,_removalAttempts)
    _wounds set [_woundIndexToRemove, objNull];
    _wounds = _wounds - [objNull];
    _removedWoundBodyParts pushBackUnique (_wound # 1);

    _unit setVariable [STRING(VAR_OPEN_WOUNDS), _wounds, false];
    [_unit] call ace_medical_status_fnc_updateWoundBloodLoss;

};

// Only make the wound changes public after all iterating is done.
if (!isNil '_wounds') then
{
    _unit setVariable [STRING(VAR_OPEN_WOUNDS), _wounds, true];
    [_unit] call ace_medical_engine_fnc_updateDamageEffects;

    // This section is adapted from ace_medical_treatment_fnc_bandageLocal.
    if IS_TRUE(ace_medical_treatment_clearTraumaAfterBandage) then
    {
        {
            private _bodyPartToCheck = _x;
            private _foundWoundOnPart = _wounds findIf
            {
                _x params ["", "_xBodyPartN", "_xAmountOf"];
                (_bodyPartToCheck == _xBodyPartN) && {_xAmountOf > 0}
            };

            if (_foundWoundOnPart == -1) then
            {
                private _bodyPartDamage = _patient getVariable ["ace_medical_bodyPartDamage", [0,0,0,0,0,0]];

                _bodyPartDamage set [_partIndex, 0];
                _patient setVariable ["ace_medical_bodyPartDamage", _bodyPartDamage, true];

                switch (_partIndex) do
                {
                    case 0: { [_patient, true, false, false, false] call ace_medical_engine_fnc_updateBodyPartVisuals; };
                    case 1: { [_patient, false, true, false, false] call ace_medical_engine_fnc_updateBodyPartVisuals; };
                    case 2;
                    case 3: { [_patient, false, false, true, false] call ace_medical_engine_fnc_updateBodyPartVisuals; };
                    default { [_patient, false, false, false, true] call ace_medical_engine_fnc_updateBodyPartVisuals; };
                };

            };

        } forEach _removedWoundBodyParts;

    };
};

// Reset cardiac vitals, they may drift away from these values after wake-up but this function should ensure the unit has plenty of time to get treatment.
_unit setVariable [STRING(VAR_HEART_RATE), DEFAULT_HEART_RATE, true];
_unit setVariable [STRING(VAR_BLOOD_PRESS), [80, 120], true];
_unit setVariable [STRING(VAR_PERIPH_RES), DEFAULT_PERIPH_RES, true];

DEBUG_FORMAT1_LOG("[REVIVE]: All preparations made, waking up '%1'.",_unit)
[_unit, false] call ace_medical_fnc_setUnconscious;
