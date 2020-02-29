#include "macros.hpp"

params ["_modName", "_bindName"];

_bind = [_modName, _bindName] call cba_fnc_getKeybind;

if (isNil '_bind') exitWith {};

_keyConfig = _bind select 5;

(_keyConfig call cba_fnc_LocalizeKey)
