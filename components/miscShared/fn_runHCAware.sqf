#include "macros.hpp"

params ["_args", "_funcStr"];

_shouldExit = [_funcStr, _args] call f_fnc_tryRunOnHeadlessClient;
if (_shouldExit) exitWith {};

_func = missionNamespace getVariable ["_funcStr", {}];
_args spawn _func;
