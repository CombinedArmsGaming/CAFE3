// ====================================================================================

// F3 - Disable Saving and Auto Saving
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

enableSaving [false, false];

// ====================================================================================

// F3 - Mute Orders and Reports
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

enableSentences false;

// ====================================================================================

if (hasInterface) then
{
	#include "configuration\groups\clientConfigGroup.sqf"

	#include "startup\groups\clientStartupGroup.sqf"

};

if (isServer) then
{
	#include "configuration\groups\serverConfigGroup.sqf"

	#include "startup\groups\serverStartupGroup.sqf"

};



//if (isServer and {bub_allowKillTracking == 1}) then
//{
//	_killTracking = profileNamespace getVariable ["bub_killTracking", []];
//	diag_log format ["[TrackKills] Initial log state: %1", _killTracking];
//
//	[] spawn
//	{
//		while {true} do
//		{
//			uiSleep 120;
//			diag_log "[TrackKills] Saving log.";
//			saveProfileNamespace;
//		};
//
//	};
//
//};
