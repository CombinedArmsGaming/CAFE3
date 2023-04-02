params ["_side"];

private _entries = values f_map_radioChannels;
_entries = _entries select {_x#0 isEqualTo _side};

private _retArray = [];

{
    _retArray pushBack [_x#1, +(_x#2)];
} foreach _entries;

_retArray