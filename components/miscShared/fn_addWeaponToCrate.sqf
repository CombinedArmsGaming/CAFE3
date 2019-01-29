#include "macros.hpp"

params ["_array", "_crate"];

RUN_LOCAL_TO(_crate,f_fnc_addWeaponToCrate,_this);

_weapon = _array select 0;
_muzzleDevice = _array select 1;
_pointer = _array select 2;
_optic = _array select 3;
_primaryMag = _array select 4;

_secondaryMag = [];
_bipod = "";

if (count _array < 7) then
{
    _bipod = _array select 5;
}
else
{
    _secondaryMag = _array select 5;
    _bipod = _array select 6;
};

_crate addWeaponCargoGlobal [_weapon, 1];

if (typeName _primaryMag == "ARRAY" and {count _primaryMag > 0}) then {_crate addMagazineAmmoCargo _primaryMag};
if (typeName _secondaryMag == "ARRAY" and {count _secondaryMag > 0}) then {_crate addMagazineAmmoCargo _secondaryMag};

if (_muzzleDevice != "") then
{
    _crate addItemCargoGlobal [_muzzleDevice, 1];
};

if (_pointer != "") then
{
    _crate addItemCargoGlobal [_pointer, 1];
};

if (_optic != "") then
{
    _crate addItemCargoGlobal [_optic, 1];
};

if (_bipod != "") then
{
    _crate addItemCargoGlobal [_bipod, 1];
};
