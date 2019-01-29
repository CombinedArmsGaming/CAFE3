
#include "macros.hpp"

params ["_crate", "_loadout"];

RUN_LOCAL_TO(_crate,f_fnc_insertLoadoutIntoCrate,_this);

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;


_backpacks = [];
_weapons = [];
_magazines = [];
_items = [];


_appendWeapon =
{
    params ["_weapons", "_magazines", "_items", "_array"];

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

    _weapons pushBack [_weapon, 1];
    if (count _primaryMag > 0) then {_magazines pushBack _primaryMag};
    if (count _secondaryMag > 0) then {_magazines pushBack _secondaryMag};
    _items append ([_muzzleDevice, _pointer, _optic, _bipod] call BIS_fnc_consolidateArray);

};


_appendContainer =
{
    params ["_backpacks", "_magazines", "_items", "_array"];

    _container = _array select 0;
    _contents = _array select 1;

    _backpacks pushBack [_container, 1];

    {
        if !(_x isEqualTo [] or {_x isEqualTo ""}) then
        {
            if (count _x == 2) then
            {
                _items pushBack _x;
            }
            else
            {
                if (count _x == 3) then
                {
                    _magazines pushBack _x;
                }
            }
        };

    } forEach _contents;

};


_primaryWeaponArray = _loadout select 0;

if !(_primaryWeaponArray isEqualTo []) then
{
    _array = _primaryWeaponArray;
    [_weapons, _magazines, _items, _array] call _appendWeapon;

};


_launcherArray = _loadout select 1;

if !(_launcherArray isEqualTo []) then
{
    _array = _launcherArray;
    [_weapons, _magazines, _items, _array] call _appendWeapon;

};


_secondaryWeaponArray = _loadout select 2;

if !(_secondaryWeaponArray isEqualTo []) then
{
    _array = _secondaryWeaponArray;
    [_weapons, _magazines, _items, _array] call _appendWeapon;

};


_uniform = _loadout select 3;

if !(_uniform isEqualTo []) then
{
    _array = _uniform;
    [_items, _magazines, _items, _array] call _appendContainer;

};


_vest = _loadout select 4;

if !(_vest isEqualTo []) then
{
    _array = _vest;
    [_items, _magazines, _items, _array] call _appendContainer;

};


_backpack = _loadout select 5;

if !(_backpack isEqualTo []) then
{
    _array = _backpack;
    [_backpacks, _magazines, _items, _array] call _appendContainer;

};


_helmet = _loadout select 6;
_facewear = _loadout select 7;

_items append [[_helmet, 1], [_facewear, 1]];


_binoculars = _loadout select 8;

if !(_binoculars isEqualTo []) then
{
    _array = _binoculars;
    [_weapons, _magazines, _items, _array] call _appendWeapon;

};


_assignedItems = (_loadout select 9) call BIS_fnc_consolidateArray;
_items append _assignedItems;


{
    _crate addBackpackCargoGlobal _x;

} forEach _backpacks;


{
    _crate addWeaponCargoGlobal _x;

} forEach _weapons;

{
    if (typeName _x == "ARRAY" and {_x select 0 != ""}) then
    {
        _crate addItemCargoGlobal _x;
    };

} forEach _items;

{
    _crate addMagazineAmmoCargo _x;

} forEach _magazines;
