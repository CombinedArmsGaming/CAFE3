params ["_loadout"];

_items = _loadout#9;
_newItems = [];

{
    _isRadio = (_x select [0,9]) isEqualTo "ItemRadio";

    if !(_isRadio) then
    {
        _newItems pushBack _x;
    }
    else
    {
        _newItems pushBack "";
    };

} forEach _items;

_loadout set [9, _newItems];
