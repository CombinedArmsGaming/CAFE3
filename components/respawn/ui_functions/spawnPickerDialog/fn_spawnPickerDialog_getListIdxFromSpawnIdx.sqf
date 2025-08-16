#include "macros.hpp"
/*
    Helper function to get the listbox index from an index into the spawns list
*/

disableSerialization;

params ["_spawnIdx", "_spawnList"];

private _return = -1;

for "_i" from 0 to ((lbSize _spawnList) - 1) do {
    if (_spawnIdx == _spawnList lbValue _i) then {
        _return = _i;
        break;
    };
};

DEBUG_FORMAT2_LOG("[RESPAWN] getListIdxFromSpawnIdx got spawn idx %1, returned list idx %2", _spawnIdx, _return);

_return
