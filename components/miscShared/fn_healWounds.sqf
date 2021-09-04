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

while
{
    _removalIteration = _removalIteration + 1;
    _wounds = GET_OPEN_WOUNDS(_unit);

    ((count _wounds) > 0) and (_removalIteration <= _woundsToHeal)
}
do
{
    private _woundIndexToRemove = floor random count _wounds;

    DEBUG_FORMAT2_LOG("[REMOVE WOUNDS]: Removing wound %1 (iteration %2)...",_woundIndexToRemove,_removalIteration)
    _wounds set [_woundIndexToRemove, objNull];
    _wounds = _wounds - [objNull];

    _unit setVariable [STRING(VAR_OPEN_WOUNDS), _wounds, false];

};

// Only make the wound changes public after all iterating is done.
if (!isNil '_wounds') then
{
    _unit setVariable [STRING(VAR_OPEN_WOUNDS), _wounds, true];
    [_unit] call ace_medical_status_fnc_updateWoundBloodLoss;
};
