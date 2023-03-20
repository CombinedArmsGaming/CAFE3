#include "macros.hpp"

params ["_unit", "_typeofUnit", "_gearVariant"];

_gearVariant = toLower _gearVariant;
_typeofUnit = toLower _typeofUnit;


if (_typeofUnit find "crate_" == 0) exitWith
{
    _crateArray = +LOADOUT_VAR_DYNAMIC(_gearVariant,_typeofUnit);
    ["CA_PreGearscriptCrate_Local", [_typeOfUnit, _unit, _faction, _crateArray]] call CBA_fnc_localEvent;

    if ((typeName _crateArray == "ARRAY") and {_crateArray IsNotEqualTo []}) then
    {
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;

        {
            switch (_x select 0) do
            {
                case "backpack":
                {
                    DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: Adding %1 to backpack cargo in %2.",(_x select 1),_typeofUnit)
                    _unit addBackpackCargoGlobal (_x select 1);
                };

                default
                {
                    _unit addItemCargoGlobal _x;
                };

            };

        } forEach _crateArray;

        //Add Space to drop stuff into the box
        private _oldLoad = loadAbs _unit;
        private _newLoad = _oldLoad * 1.25;

        [_unit, _newLoad] remoteExecCall ["setMaxLoad", 2];

    }
    else
    {
        DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: Skipping crate type %1 for side %2 because it is empty or undefined.",_typeofUnit,_gearVariant)
    };

    ["CA_PostGearscriptCrate_Local", [_typeOfUnit, _unit, _faction, _crateArray]] call CBA_fnc_localEvent;

};


_loadoutVariants = LOADOUT_VAR_DYNAMIC(_gearVariant,_typeofUnit);


if (_loadoutVariants isEqualTo []) then
{
    DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: No '%1' loadouts found for side '%2' - attempting to use default...",_typeofUnit,_gearVariant)
    _typeofUnit = "default";

    _loadoutVariants = LOADOUT_VAR_DYNAMIC(_gearVariant,_typeofUnit);

};


if (_loadoutVariants isEqualTo []) exitWith
{
    DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: No '%1' loadouts found for side '%2' - aborting loadout.",_typeofUnit,_gearVariant)
};


private _originalLoadout = +(selectRandom _loadoutVariants);
private _loadout = _originalLoadout;
private _extendedArray = [];

// Check for CBA extended loadout, unwrap if present.
if (count _originalLoadout != 10) then
{
	_loadout = _originalLoadout#0;
    _extendedArray = _originalLoadout#1;
};


if (count HATS_DYNAMIC(_gearVariant,_typeofUnit) > 0) then
{
    private _hat = selectRandom HATS_DYNAMIC(_gearVariant,_typeofUnit);
    DEBUG_FORMAT1_LOG("Selected variant hat: %1",_hat)

    _loadout set [6, _hat];
};


if (count VESTS_DYNAMIC(_gearVariant,_typeofUnit) > 0) then
{
    private _vest = selectRandom VESTS_DYNAMIC(_gearVariant,_typeofUnit);
    DEBUG_FORMAT1_LOG("Selected variant vest: %1",_vest)

    _loadout select 4 set [0, _vest];
};


if (count UNIFORMS_DYNAMIC(_gearVariant,_typeofUnit) > 0) then
{
    private _uniform = selectRandom UNIFORMS_DYNAMIC(_gearVariant,_typeofUnit);
    DEBUG_FORMAT1_LOG("Selected variant uniform: %1",_uniform)

    _loadout select 3 set [0, _uniform];
};


if (count BACKPACKS_DYNAMIC(_gearVariant,_typeofUnit) > 0) then
{
    private _backpack = selectRandom BACKPACKS_DYNAMIC(_gearVariant,_typeofUnit);
    DEBUG_FORMAT1_LOG("Selected variant backpack: %1",_backpack)

    _loadout select 5 set [0, _backpack];
};


["CA_PreGearscriptUnit_Local", [_typeOfUnit, _unit, _faction, _originalLoadout]] call CBA_fnc_localEvent;

DEBUG_FORMAT1_LOG("Final loadout: %1",_loadout)
_unit setUnitLoadout _loadout;

["CA_PostGearscriptUnit_Local", [_typeOfUnit, _unit, _faction, _originalLoadout]] call CBA_fnc_localEvent;