#include "macros.hpp"

// Convenience function to retrieve a respawn location array using the location and the target.
// If no respawn is registered for the location and the given target, an empty array is returned (even if there are other existing registrations for the location).

SERVER_ONLY;

params [["_location", nil, ["", objNull]], "_target"];

private _respawnsList = [_location] call f_fnc_getRespawnRegistrations;
private _respawnIndex = _respawnsList findIf {_x#2 isEqualTo _target};

if (_respawnIndex < 0) exitWith {[]};

(_respawnsList # _respawnIndex) + [_respawnIndex]