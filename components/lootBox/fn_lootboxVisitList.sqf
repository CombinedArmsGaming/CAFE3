#include "macros.hpp"

params ["_entry", "_output"];

DEBUG_FORMAT1_LOG("Visiting loot list (%1)",(_entry select 0))

_values = [];
_weights = [];

{
    _values pushBack (_x select 0);
    _weights pushBack (_x select 1);

} forEach (_entry select 1);

_quantity = [_entry select 2] call f_fnc_lootboxRollQuantity;
_nextCalls = [];

for "_i" from 1 to _quantity do
{
    _selected = (_values selectRandomWeighted _weights);
    _nextCalls pushBack [[_selected, _output], f_fnc_lootboxVisitUnknown];
};

_nextCalls
