#include "macros.hpp"

RUN_ON_SERVER(f_fnc_trackStaticKillsInAO,);

_alreadyTracked = missionNamespace getVariable ["f_var_staticKillsTracked", false];

if (_alreadyTracked isEqualTo true) exitWith
{
	diag_log "[TrackKills] Static kills already tracked.";
};


DEBUG_PRINT_LOG("[TrackKills] Beginning kill-tracking of static objects.")

addMissionEventHandler ["BuildingChanged",
{
	params ["_previousObject", "_newObject", "_isRuin"];

	[_previousObject, _newObject, _isRuin] call f_fnc_trackKilledStaticEvent;

}];

f_var_staticKillsTracked = true;
