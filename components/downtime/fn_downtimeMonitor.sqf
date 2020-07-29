#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_downtimeMonitor);


waitUntil
{
    waitUntil { sleep 0.1; PLAYER_IS_DOWN };

    SHOULD_CONTINUE = true;

    _startedTime = time;
    waitUntil { (!IS_UNCONSCIOUS(player)) or {time - _startedTime > DOWNTIME_SNOOZE_TIME} };

    if (PLAYER_IS_DOWN) then
    {
        [] spawn f_fnc_downtimeSpectate;
    };    

    waitUntil {sleep 0.1; !PLAYER_IS_DOWN};

    SHOULD_CONTINUE = false;

    false

};
