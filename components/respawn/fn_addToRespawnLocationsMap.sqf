params ["_respawnEntry"];

private _key = _respawnEntry#0;

private _keyList = f_var_respawnLocationsMap getOrDefault [_key, [], true];
_keyList pushBack _respawnEntry;