// Convenience function to retrieve a respawn manager array using the location and the target.
// If no respawn is registered for the location and the given target, an empty array is returned (even if there are other existing registrations for the location).

params ["_location", "_target"];

private _key = [_location, _target] call f_fnc_getRespawnKey;
private _respawnEntry = f_var_respawnPollersMap getOrDefault [_key, []];