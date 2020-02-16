#include "..\macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeSpectate);

[true, true, false] call ace_spectator_fnc_setSpectator;

waitUntil {!f_var_downtimeExperienceActive};

[false, true, false] call ace_spectator_fnc_setSpectator;
