#include "macros.hpp"

// Takes a loadout and removes all radios from it.

params ["_loadout"];

private _filterOutRadios =
{
    if (_this isEqualTo []) exitWith {};

    private _retArray = [];

    {
        private _name = _x#0;
        if !([_name] call acre_api_fnc_isBaseRadio or {[_name] call acre_api_fnc_isRadio}) then
        {
            _retArray pushBack _x;
        };

    } forEach (_this#1);

    [_this#0, _retArray]
};

if (count _loadout != 10) then
{
    _loadout = _loadout # 0;
};

private _uniform = _loadout # 3;
private _vest = _loadout # 4;
private _backpack = _loadout # 5;

_loadout set [3, _uniform call _filterOutRadios];
_loadout set [4, _vest call _filterOutRadios];
_loadout set [5, _backpack call _filterOutRadios];

private _assignedItems = _loadout # 9;
_assignedItems set [2, ""];