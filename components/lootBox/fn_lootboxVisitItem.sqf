#include "macros.hpp"

params ["_entry", "_output"];

DEBUG_FORMAT2_LOG("Visiting loot item (%1, %2)",(_entry select 0),(_entry select 1))

_item = _entry select 1;
_itemType = _entry select 2;

if !(_item isEqualTo "") then
{
    _output pushBack [_item, _itemType, 1];
};

[]
