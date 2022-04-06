#include "macros.hpp"

params ["_unit", "_typeofUnit", "_gearVariant"];

_gearVariant = toLower _gearVariant;
_typeofUnit = toLower _typeofUnit;

private _gunbagContents = GUNBAG_ITEM_DYNAMIC(_gearVariant,_typeofUnit);
private _gunbagVariableValue = [];

if !(_gunbagContents isEqualTo []) then
{
    _gunbagContents params ["_attachments", "_muzzles", "_magazines", "_ammo", "_baseWeapon"];

    private _gunbagMags = [];
    {
        _gunbagMags pushBack [_x, _ammo # _forEachIndex];

    } forEach _magazines;

    _gunbagVariableValue = 
    [
        _baseWeapon,
        _attachments,
        _gunbagMags
    ];
};

// Wait a short while and apply gunbag contents.  Avoids issue on spawn where ACE can potentially override intended value.
[
    // Script
    {
        params ["_unit", "_contents"];

        if (_contents isEqualTo []) then
        {
            _contents = nil;
        };

        (backpackContainer _unit) setVariable ["ace_gunbag_gunbagWeapon", _contents, true];
    },

    // Arguments
    [_unit, _gunbagVariableValue],

    // Delay
    0.5

] call CBA_fnc_waitAndExecute;