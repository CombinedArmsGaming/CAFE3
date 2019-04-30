#include "macros.hpp"

SERVER_ONLY;

params ["_newEndTime"];

_lastEndTime = missionNamespace getVariable ["f_var_safestart_end", 0];
missionNamespace setVariable ["f_var_safestart_end", _newEndTime, true];

if (_lastEndTime <= time and {_newEndTime > time}) exitWith
{
    f_var_safeStartEnabled = true;
    [] remoteExec ["f_fnc_enableSafeStart", 0, "SafeStartSync"];

    [] call f_fnc_safeStartLoop;

};

if (_lastEndTime > time and {_newEndTime <= time}) exitWith
{
    f_var_safeStartEnabled = false;
    [] remoteExec ["f_fnc_disableSafeStart", 0, "SafeStartSync"];

};
