#include "macros.hpp"

SERVER_ONLY;

DEBUG_PRINT_LOG("[AICACHE-2]: Entered AI Cache init.")

// Check whether the parameter is defined (or caching switched off)) - if not, just exit
if ((isNil "f_param_caching") or {f_param_caching == 0}) exitWith {};

// Wait for the mission to have launched before starting to cache.
WAIT_UNTIL_MISSION_STARTED();

// Wait up to the desired time into the mission to give AI and players time to settle
waitUntil { time > f_var_cacheWait };

DEBUG_PRINT_LOG("[AICACHE-2]: Initialising AI caching...")

private _playableGroups = playableUnits apply {group _x};
_playableGroups = _playableGroups call BIS_fnc_consolidateArray;
_playableGroups = _playableGroups apply {_x select 0};

{
    _x setVariable ["f_cacheExcl", true, true];

} forEach _playableGroups;

f_arr_civPopModules = allMissionObjects "ModuleCivilianPresence_F";


[] call f_fnc_mainAiCachingLoop;
[] call f_fnc_maintainAiCachingAnchorsArray;
[] spawn f_fnc_uncacheGroupsWhenAiCachingDisabled;


DEBUG_PRINT_LOG("[AICACHE-2]: All loops started.")

_shouldUncacheNearZeus = ((f_var_uncacheWhenNear isEqualTo PLAYERS_AND_ZEUS) or {f_var_uncacheWhenNear isEqualTo PLAYERS_AND_DRONES_AND_ZEUS});
missionNamespace setVariable ["f_var_uncacheNearZeus", _shouldUncacheNearZeus, true];

_shouldUncacheNearDrone = ((f_var_uncacheWhenNear isEqualTo PLAYERS_AND_DRONES) or {f_var_uncacheWhenNear isEqualTo PLAYERS_AND_DRONES_AND_ZEUS});
missionNamespace setVariable ["f_var_uncacheNearDrones", _shouldUncacheNearDrone, true];
