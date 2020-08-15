#include "macros.hpp"

params ["_entry", "_output"];

DEBUG_FORMAT1_LOG("Visiting loot group (%1)",(_entry select 0))

_contents = (_entry select 1);

_nextCalls = [];

{
    _nextCalls pushBack [[_x, _output], f_fnc_lootboxVisitUnknown];

} forEach _contents;

_nextCalls
