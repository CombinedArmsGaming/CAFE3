
#include "macros.hpp"

params ["_crate", "_loadout"];

RUN_LOCAL_TO(_crate,f_fnc_insertLoadoutIntoCrate,_this);

clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;


private _backpacks = [];
private _weapons = [];
private _magazines = [];
private _items = [];


private _appendContainer =
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


private _primaryWeaponArray = _loadout select 0;

if !(_primaryWeaponArray isEqualTo []) then
{
    private _array = _primaryWeaponArray;
    _weapons pushBack _array;
};


private _launcherArray = _loadout select 1;

if !(_launcherArray isEqualTo []) then
{
    private _array = _launcherArray;
    _weapons pushBack _array;
};


private _secondaryWeaponArray = _loadout select 2;

if !(_secondaryWeaponArray isEqualTo []) then
{
    private _array = _secondaryWeaponArray;
    _weapons pushBack _array;
};


private _uniform = _loadout select 3;

if !(_uniform isEqualTo []) then
{
    private _array = _uniform;
    [_items, _magazines, _items, _array] call _appendContainer;

};


private _vest = _loadout select 4;

if !(_vest isEqualTo []) then
{
    private _array = _vest;
    [_items, _magazines, _items, _array] call _appendContainer;

};


private _backpack = _loadout select 5;

if !((_backpack isEqualTo []) or {(_backpack#0) isEqualTo (typeOf _crate)}) then
{
    private _array = _backpack;
    [_backpacks, _magazines, _items, _array] call _appendContainer;

};


private _helmet = _loadout select 6;
private _facewear = _loadout select 7;

_items append [[_helmet, 1], [_facewear, 1]];


private _binoculars = _loadout select 8;

if !(_binoculars isEqualTo []) then
{
    private _array = _binoculars;
    _weapons pushBack _array;
};


private _assignedItems = (_loadout select 9) call BIS_fnc_consolidateArray;
_items append _assignedItems;


{
    _crate addBackpackCargoGlobal _x;

} forEach _backpacks;


{
    _crate addWeaponWithAttachmentsCargoGlobal [_x, 1];

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
