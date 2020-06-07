#include "macros.hpp"

SERVER_ONLY;
RUN_AS_ASYNC(f_fnc_activateAiDriver);

params ["_vehicle"];

_vehicle setVariable ["f_var_aiDriverEnabled", true, true];

waitUntil { !(isNull (effectiveCommander _vehicle)) };

_driver = objNull;


while { _vehicle getVariable ["f_var_aiDriverEnabled", false] isEqualTo true } do
{
    _commander = objNull;
    _cancelAIDriver = false;

    waitUntil
    {
        sleep 0.2;
        _commander = effectiveCommander _vehicle;

        _mustRefreshDriver = (isNull _driver) or {!(alive _driver)} or {!((owner _driver) isEqualTo (owner _commander))};
        _driverSeatFree = (isNull (driver _vehicle)) or {(driver _vehicle) isEqualTo _driver};
        _cancelAIDriver = !(_vehicle getVariable ["f_var_aiDriverEnabled", false]);

        (_mustRefreshDriver and _driverSeatFree) or _cancelAIDriver

    };

    if (_cancelAIDriver) exitWith {};

    _vehicle lockDriver false;

    if !(isNull _driver) then
    {
        deleteVehicle _driver;
    };

    _driver = createAgent [(typeOf _commander), [0,0,0], [], 0, "NONE"];
    _driver hideObjectGlobal true;

    _driver setVariable ["isAIDriver", true, true];
    [_driver] call f_fnc_giveUnitGodmode;

    _driver moveInDriver _vehicle;
    _driver setOwner (owner _commander);

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
