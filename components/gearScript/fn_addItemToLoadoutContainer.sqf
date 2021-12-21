#include "macros.hpp"

params ["_faction", "_unitType", "_containerIndex", "_itemName", "_itemAmount"];

_faction = toLower _faction;
_unitType = toLower _unitType;

private _loadoutVariants = LOADOUT_VAR_DYNAMIC(_faction,_unitType);

if (_loadoutVariants isEqualTo []) exitWith
{
    DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: No '%1' loadouts found for side '%2'.  Cannot add item '%3'.",_unitType,_faction,_itemName)
};

if !(_containerIndex in [3, 4, 5]) exitWith
{
    DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Invalid container index '%1' while adding item '%2' to loadout '%3'.",_containerIndex,_itemName,_unitType)
};

DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Adding item '%1' to loadout '%2' for side '%3'.",_itemName,_unitType,_faction)

private _itemToAdd = [_itemName, _itemAmount];
private _magConfig = (configFile >> "CfgMagazines" >> _itemName);

if !(isNull _magConfig) then
{
    private _ammoCount = getNumber (_magConfig >> "count");
    _itemToAdd = [_itemName, _itemAmount, _ammoCount];
};

{    
    private _container = _x # _containerIndex;    
    if (_container isNotEqualTo []) then
    {
        private _contents = _container # 1;
        _contents pushBack _itemToAdd;
    };
    
} forEach _loadoutVariants;
