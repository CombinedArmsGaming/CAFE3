#include "macros.hpp"

SERVER_ONLY;

#ifdef ENABLE_SLOTTING_GENERATOR_MODE

// Disable AI in slotty gen mode so they don't kill eachother.
[
    {
        time > 0
    },
    {
        private _allAi = allUnits select {!isPlayer _x};
        _allAi = _allAi select {_x isKindOf "CAManBase"};
        
        {
            _x disableAI "ALL";
        } forEach _allAi;
    },
    []
] call CBA_fnc_waitUntilAndExecute;

#endif