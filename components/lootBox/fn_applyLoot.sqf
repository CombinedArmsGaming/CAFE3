#include "macros.hpp"

params ["_container", "_loot"];

_lootbox = LOOTBOX_VAR_DYNAMIC(_loot);
if (_lootbox isEqualTo []) exitWith
{
	DEBUG_FORMAT1_LOG("Lootbox '%1' does not exist.",_loot)
};

_output = [];
_stack = [];

_stack pushBack [[_lootbox, _output], f_fnc_lootboxVisitGroup];
_lastIndex = 0;

// No info out there about whether SQF supports tail recursion optimization, so have this instead of recursion.  good one
while {_lastIndex >= 0} do
{
    _thisCall = (_stack deleteAt _lastIndex);
    _lastIndex = _lastIndex - 1;

    _nextCalls = (_thisCall select 0) call (_thisCall select 1);

    {
        _stack pushBack _x;
        _lastIndex = _lastIndex + 1;

    } forEach _nextCalls;

};

{
    _itemName = _x select 0;
    _itemType = _x select 1;
    _quantity = _x select 2;

    if (_itemType isEqualTo ITEMTYPE_ITEM) then
    {
        _container addItemCargoGlobal [_itemName, _quantity];
    }
    else
    {
        if (_itemType isEqualTo ITEMTYPE_BACKPACK) then
        {
            _container addBackpackCargoGlobal [_itemName, _quantity];
        };
        
    };

} forEach _output;
