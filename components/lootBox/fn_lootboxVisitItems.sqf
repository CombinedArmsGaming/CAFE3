#include "macros.hpp"

params ["_entry", "_output"];

DEBUG_FORMAT2_LOG("Visiting loot items (%1, %2, %3)",(_entry select 0),(_entry select 1),(_entry select 2))

_item = _entry select 1;
_quantities = _entry select 2;
_itemType = _entry select 3;

if !(_item isEqualTo "") then
{
    _quantity = [_quantities] call f_fnc_lootboxRollQuantity;
    _output pushBack [_item, _itemType, _quantity];
};

[]
