#include "macros.hpp"

// CAFE - Multiplayer Ending Controller
// Credits: Please see the CAFE online manual (https://github.com/CombinedArmsGaming/CAFE3/wiki)
// ====================================================================================

SERVER_ONLY;

// SET ENDING & BROADCAST
// The desired ending # is taken from the arguments passed to this script.
// Using BIS_fnc_MP the function mpEndReceiver is being spawned on all clients (and server),
// with the passed ending # as parameter

_this remoteExec ["f_fnc_performEnding"];

// ====================================================================================
