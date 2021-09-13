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
#define VAR_OPEN_WOUNDS                 ace_medical_openWounds
#define GET_OPEN_WOUNDS(unit)           (unit getVariable [STRING(VAR_OPEN_WOUNDS), []])

params ["_unit", ["_woundsToHeal", 10, [0]]];
RUN_LOCAL_TO(_unit,_this,f_fnc_healWounds);

private "_wounds";
private _removalIteration = 0;
private _removedWoundBodyParts = [];

while
{
    _removalIteration = _removalIteration + 1;
    _wounds = GET_OPEN_WOUNDS(_unit);

    ((count _wounds) > 0) and (_removalIteration <= _woundsToHeal)
}
do
{
    private _woundIndexToRemove = floor random count _wounds;
    private _wound = _wounds # _woundIndexToRemove;

    DEBUG_FORMAT2_LOG("[REMOVE WOUNDS]: Removing wound %1 (iteration %2)...",_woundIndexToRemove,_removalIteration)
    _wounds set [_woundIndexToRemove, objNull];
    _wounds = _wounds - [objNull];
    _removedWoundBodyParts pushBackUnique (_wound # 1);

    _unit setVariable [STRING(VAR_OPEN_WOUNDS), _wounds, false];

};

// Only make the wound changes public after all iterating is done.
if (!isNil '_wounds') then
{
    _unit setVariable [STRING(VAR_OPEN_WOUNDS), _wounds, true];
    [_unit] call ace_medical_status_fnc_updateWoundBloodLoss;
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
