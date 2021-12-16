#include "macros.hpp"

// CAFE - Multiplayer Ending Controller
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
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

// ====================================================================================

// CLEAN-UP OBJECTIVES & TRIGGER CUT-SCENES ETC.
// This is an opportunity to set all objectives to pass/fail, trigger cut-scenes etc.
// depending on the ending that has been selected. Initially, we identify the desired
// ending using the parsed value. By default allowed values are: 1,2,3,4,5,6.


switch (_ending) do
{
// Ending #1
	case 1:
	{
// Place any custom code for ending #1 after this line:



// Do not allow custom code for ending #1 to continue after this comment.
	};
// Ending #2
	case 2:
	{
// Place any custom code for ending #2 after this line:



// Do not allow custom code for ending #2 to continue after this comment.
	};
// Ending #3
	case 3:
	{
// Place any custom code for ending #3 after this line:



// Do not allow custom code for ending #3 to continue after this comment.
	};
// Ending #4
	case 4:
	{
// Place any custom code for ending #4 after this line:



// Do not allow custom code for ending #4 to continue after this comment.
	};
// Ending #5
	case 5:
	{
// Place any custom code for ending #5 after this line:



// Do not allow custom code for ending #5 to continue after this comment.
	};
// Ending #6
	case 6:
	{
// Place any custom code for ending #6 after this line:



// Do not allow custom code for ending #6 to continue after this comment.
	};

// Default
	default {

	};
};


_endingMusic = missionNamespace getVariable [format ["f_var_endingMusic_end%1", _ending], nil];
_ending = format ["end%1", _ending];

if (isNil "_endingMusic") then
{
	[_ending, _state] spawn BIS_fnc_endMission;
}
else
{
	[_ending, _state, true, false] spawn BIS_fnc_endMission;

	if !(_endingMusic isEqualTo "") then
	{
		playMusic _endingMusic;
	};
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
