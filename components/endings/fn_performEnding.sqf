#include "macros.hpp"

// CAFE3 - Multiplayer Ending Controller
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_ending","_state"];

_ending = _this select 0;
_state = if (count _this > 1) then {_this select 1} else {true};

// ====================================================================================

// SERVER DELAY
// If this script is executing on the server a small delay is used.

if (isServer) then
{
	sleep 3;
	DEBUG_PRINT_CHAT("DEBUG (f_fnc_mpEndReciever): This is the server.")
};

DEBUG_FORMAT2_CHAT("DEBUG (f_fnc_mpEndReciever): _ending = %1, _state = %2",_ending,_state)

//Check for custom code and execute it

private _isThereCustomEndingCodePresentInThisEnding = isText (missionConfigFile >> "CfgDebriefing" >> _ending >> "code");

if (_isThereCustomEndingCodePresentInThisEnding) then
{
	private _code = getText (missionConfigFile >> "CfgDebriefing" >> _ending >> "code");

	call compile _code;
};


//Check for custom Music and perform the ending

private _isThereMusicInThisCustomEnding = isText (missionConfigFile >> "CfgDebriefing" >> _ending >> "music");

if (_isThereMusicInThisCustomEnding) then
{
	private _endingMusic = getText (missionConfigFile >> "CfgDebriefing" >> _ending >> "music"); //Get music class

	[_ending, _state, true, false] spawn BIS_fnc_endMission;

	if !(_endingMusic isEqualTo "") then
	{
		playMusic _endingMusic;
	};
}
else
{
	[_ending, _state] spawn BIS_fnc_endMission;
};



// ====================================================================================

// EXIT THE SPECTATOR SCRIPT IF IS OPEN
// Clients just "hang" if the mission has ended but are still inside the
// spectator script.
if (dialog) then
{
	closeDialog 0;
};

// ====================================================================================
