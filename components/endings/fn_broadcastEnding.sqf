#include "macros.hpp"

// F3 - Multiplayer Ending Controller
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

SERVER_ONLY;

// SET ENDING & BROADCAST
// The desired ending # is taken from the arguments passed to this script.
// Using BIS_fnc_MP the function mpEndReceiver is being spawned on all clients (and server),
// with the passed ending # as parameter

_this remoteExec ["f_fnc_performEnding"];

// ====================================================================================
