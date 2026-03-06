#include "macros.hpp"

CLIENT_ONLY;

player setVariable [MACRO_VARNAME_FPS_LOG, diag_fps, 2];

// Loop
[
	f_fnc_client_fpsLogLoop,
	[],
	5
] call CBA_fnc_waitAndExecute;