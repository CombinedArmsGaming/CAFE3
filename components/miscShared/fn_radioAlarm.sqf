#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_radioAlarm);

_this spawn
{
    params ["_speaker", "_mast", "_label"];

    if !(alive _mast) exitWith {};
    if (missionNamespace getVariable [format ["baseboop_%1", _label], false] isEqualTo true) exitWith {};

    missionNamespace setVariable [format ["baseboop_%1", _label], true];

    (format ["A radio transmission was detected by the %1 antenna facility!", _label]) remoteExec ["hint"];

    while {alive _mast and {alive _speaker}} do
    {
        [_speaker, "Alarm_OPFOR", 1000, 1] remoteExec ["f_fnc_say3D"];

        sleep 5;
    }


};
