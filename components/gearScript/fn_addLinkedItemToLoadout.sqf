#include "macros.hpp"

params ["_faction", "_unitType", "_itemIndex", "_itemName"];

_faction = toLower _faction;
_unitType = toLower _unitType;

private _loadoutVariants = LOADOUT_VAR_DYNAMIC(_faction,_unitType);

if (_loadoutVariants isEqualTo []) exitWith
{
    DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: No '%1' loadouts found for side '%2'.  Cannot remove linked item at index '%3'.",_unitType,_faction,_itemIndex)
};

DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Removing linked item #%1 from loadout '%2' for side '%3'.",_itemIndex,_unitType,_faction)

{    
    private _loadout = _x;

    private _linkedItems = _loadout#9;
    if (count _linkedItems > _itemIndex) then
    {
        _linkedItems set [_itemIndex, _itemName];
    };
    
} forEach _loadoutVariants;
