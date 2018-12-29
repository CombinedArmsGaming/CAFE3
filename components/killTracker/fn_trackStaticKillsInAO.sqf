#include "macros.hpp"

RUN_ON_SERVER(f_fnc_trackStaticKillsInAO,)

if (f_var_staticKillsTracked isEqualTo true) exitWith
{
	diag_log "[TrackKills] Static kills already tracked.";
};


addMissionEventHandler ["BuildingChanged",
{
	params ["_previousObject", "_newObject", "_isRuin"];

	[_previousObject, _newObject, _isRuin] call f_fnc_trackKilledStaticEvent;

}];

f_var_staticKillsTracked = true;
