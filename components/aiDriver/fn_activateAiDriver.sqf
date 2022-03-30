#include "macros.hpp"

SERVER_ONLY;
RUN_AS_ASYNC(f_fnc_activateAiDriver);

#define AI_DRIVER_ENABLED(vic) ((vic getVariable ["f_var_aiDriverEnabled", false]) isEqualTo true)
#define MUST_REFRESH_DRIVER ((isNull _driver) or {!(alive _driver)} or {!((owner _driver) isEqualTo (owner _commander))} or {(vehicle _driver) isNotEqualTo _vehicle})
#define DRIVER_SEAT_IS_FREE ((isNull (driver _vehicle)) or {(driver _vehicle) isEqualTo _driver})

params ["_vehicle"];

if AI_DRIVER_ENABLED(_vehicle) exitWith {};
_vehicle setVariable ["f_var_aiDriverEnabled", true, true];

waitUntil { !(isNull (effectiveCommander _vehicle)) };

private _driver = objNull;

while { AI_DRIVER_ENABLED(_vehicle) } do
{
    private _commander = objNull;
    private _cancelAIDriver = false;

    waitUntil
    {
        sleep 0.2;
        _commander = effectiveCommander _vehicle;
        _cancelAIDriver = (isNull _commander) or {!alive _vehicle} or {!AI_DRIVER_ENABLED(_vehicle)};

        _cancelAIDriver or {MUST_REFRESH_DRIVER and {DRIVER_SEAT_IS_FREE}}

    };

    _vehicle lockDriver false;

    if !(isNull _driver) then
    {
        deleteVehicle _driver;
    };

    if (_cancelAIDriver) exitWith {};

    _driver = createAgent [(typeOf _commander), [0,0,0], [], 0, "NONE"];
    _driver hideObjectGlobal true;

    _driver setVariable ["isAIDriver", true, true];
    [_driver, false] call f_fnc_giveUnitGodmode;

    _driver moveInDriver _vehicle;
    _driver setOwner (owner _commander);

    [f_fnc_keepUnitHealthy, [_driver], 2] call CBA_fnc_waitAndExecute;

    _vehicle lockDriver true;

    sleep 1;

};


{
    if (_x getVariable ["isAIDriver", false]) then
    {
        deleteVehicle _x;
    };

} forEach (crew _vehicle);

_vehicle lockDriver false;
_vehicle setVariable ["f_var_aiDriverEnabled", false, true];
