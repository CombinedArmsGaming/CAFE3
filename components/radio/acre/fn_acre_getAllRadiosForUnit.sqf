#include "macros.hpp"

// Takes a loadout and finds all radios in it.

params ["_unit"];

private _findRadios =
{
    params ["_container", "_retArray"];

    if (_container isEqualTo []) exitWith {_retArray};

    {
        private _name = _x#0;
        if ([_name] call acre_api_fnc_isBaseRadio or {[_name] call acre_api_fnc_isRadio}) then
        {
            _retArray pushBack _name;
        };

    } forEach (_container#1);

    _retArray
};

private _loadout = getUnitLoadout _unit;

private _uniform = _loadout # 3;
private _vest = _loadout # 4;
private _backpack = _loadout # 5;

private _radios = [];

[_uniform, _radios] call _findRadios;
[_vest, _radios] call _findRadios;
[_backpack, _radios] call _findRadios;

_radios