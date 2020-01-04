#include "macros.hpp"

params ["_entry", "_output"];

_item = _entry select 1;
_itemType = _entry select 2;

if !(_item isEqualTo "") then
{
    _output pushBack [_item, _itemType, 1];
};

[]
