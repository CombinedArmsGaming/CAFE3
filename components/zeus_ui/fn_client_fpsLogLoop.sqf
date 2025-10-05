#include "macros.hpp"

CLIENT_ONLY;

player setVariable [MACRO_VARNAME_FPS_LOG, diag_fps, 2];
DEBUG_FORMAT1_LOG("[ZEUS_NOTIFIER] Client: Logged fps of %1", diag_fps);

// Loop
[
	f_fnc_client_fpsLogLoop,
	[],
	5
] call CBA_fnc_waitAndExecute;