#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeMonitor);


waitUntil
{
    waitUntil { sleep 0.1; PLAYER_IS_DOWN };

    SHOULD_CONTINUE = true;
    [] spawn f_fnc_downtimeSpectate;

    waitUntil {sleep 0.1; !PLAYER_IS_DOWN};

    SHOULD_CONTINUE = false;

    false

};
