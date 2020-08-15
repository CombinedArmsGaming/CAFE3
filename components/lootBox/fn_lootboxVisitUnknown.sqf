#include "macros.hpp"

params ["_entry", "_output"];

DEBUG_FORMAT1_LOG("Visiting unknown loot ent (%1)",(_entry select 0))

_nextCall = [];

switch (_entry select 0) do
{
    case (LOOT_SINGLE):
    {
		DEBUG_PRINT_LOG("Resolved as single item.")
        _nextCall = [[_entry, _output], f_fnc_lootboxVisitItem];
    };

    case (LOOT_MULTIPLE):
    {
		DEBUG_PRINT_LOG("Resolved as multiple items.")
        _nextCall = [[_entry, _output], f_fnc_lootboxVisitItems];
    };

    case (LOOT_LIST):
    {
		DEBUG_PRINT_LOG("Resolved as loot list.")
        _nextCall = [[_entry, _output], f_fnc_lootboxVisitList];
    };

    case (LOOT_GROUP):
    {
		DEBUG_PRINT_LOG("Resolved as loot group.")
        _nextCall = [[_entry, _output], f_fnc_lootboxVisitGroup];
    };

    case (LOOT_BOX):
    {
		DEBUG_PRINT_LOG("Resolved as loot box.")
        _nextCall = [[_entry, _output], f_fnc_lootboxVisitGroup];
    };

};

[_nextCall]
