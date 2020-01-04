#include "macros.hpp"

params ["_entry", "_output"];

_nextCall = [];

switch (_entry select 0) do
{
    case (LOOT_SINGLE):
    {
        _nextCall = [[_entry, _output], f_fnc_lootboxVisitItem];
    };

    case (LOOT_MULTIPLE):
    {
        _nextCall = [[_entry, _output], f_fnc_lootboxVisitItems];
    };

    case (LOOT_LIST):
    {
        _nextCall = [[_entry, _output], f_fnc_lootboxVisitList];
    };

    case (LOOT_GROUP):
    {
        _nextCall = [[_entry, _output], f_fnc_lootboxVisitGroup];
    };

    case (LOOT_BOX):
    {
        _nextCall = [[_entry, _output], f_fnc_lootboxVisitGroup];
    };

};

[_nextCall]
