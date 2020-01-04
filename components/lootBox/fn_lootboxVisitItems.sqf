#include "macros.hpp"

params ["_entry", "_output"];

_item = _entry select 1;
_quantities = _entry select 2;
_itemType = _entry select 3;

if !(_item isEqualTo "") then
{
    _quantity = [_quantities] call f_fnc_lootboxRollQuantity;
    _output pushBack [_item, _itemType, _quantity];
};

[]
