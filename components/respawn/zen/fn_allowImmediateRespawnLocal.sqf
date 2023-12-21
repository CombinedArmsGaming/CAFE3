#include "../macros.hpp"

params [["_location", objNull, [objNull, []]], ["_locationName", "Unnamed", [""]]];

private _ticketsRemaining = [player, 0, true] call BIS_fnc_respawnTickets;
if (_ticketsRemaining <= 0) then
{
    [player, 1, false] call BIS_fnc_respawnTickets;
};

if (_location isNotEqualTo objNull) then
{
    systemChat format ["Respawning at %1, %2", _location, _locationName];
    missionNamespace setVariable ["f_var_spawnPickerDialog_selectedSpawn", [_location, _locationName]];
};

setPlayerRespawnTime MINIMUM_RESPAWN_DELAY;