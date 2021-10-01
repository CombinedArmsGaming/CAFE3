#include "macros.hpp"

/*
    Fix overdose for ACE3 (as of 2021-09-02), by Bubbus

    Given any unit:
        * Takes them out of cardiac arrest.
        * Removes all medication from their system.
        * Resets all cardiac vitals.

    If the unit is unconscious, they should wake up naturally unless they have lost too much blood.

    This function uses threshold values from ACE medical, which may be subject to change.
    If ACE medical has changed sunstantially since this function was written, it may no longer work properly.

 */

// These macros are from ACE itself, with minor adjustments to work here.
// Duplicating macros instead of importing ACE macro file, so if the ACE macro file moves in a future medical rewrite, it doesn't crash Arma here.
#define DEFAULT_BLOOD_VOLUME            6.0
#define DEFAULT_HEART_RATE              80
#define DEFAULT_PERIPH_RES              100
#define VAR_BLOOD_PRESS                 ace_medical_bloodPressure
#define VAR_MEDICATIONS                 ace_medical_medications
#define VAR_CRDC_ARRST                  ace_medical_inCardiacArrest
#define VAR_HEART_RATE                  ace_medical_heartRate
#define VAR_PERIPH_RES                  ace_medical_peripheralResistance
#define IN_CRDC_ARRST(unit)             (unit getVariable [STRING(VAR_CRDC_ARRST), false])

params ["_unit"];
RUN_LOCAL_TO(_unit,_this,f_fnc_fixOverdose);

// Following example from ACE's fullHeal function, Need to remove cardiac arrest before anything else.
if IN_CRDC_ARRST(_unit) then
{
    ["ace_medical_CPRSucceeded", _unit] call CBA_fnc_localEvent;
};

DEBUG_FORMAT1_LOG("[FIX OVERDOSE]: Resetting meds on %1",(name _unit))
_unit setVariable [STRING(VAR_MEDICATIONS), [], true];

// Reset cardiac vitals, they may drift away from these values depending on injury.
_unit setVariable [STRING(VAR_HEART_RATE), DEFAULT_HEART_RATE, true];
_unit setVariable [STRING(VAR_BLOOD_PRESS), [80, 120], true];
_unit setVariable [STRING(VAR_PERIPH_RES), DEFAULT_PERIPH_RES, true];
