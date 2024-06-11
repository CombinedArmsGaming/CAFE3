#include "macros.hpp"

#ifdef ENABLE_SLOTTING_GENERATOR_MODE

call
{
    // Generate slotting code
    private _generateSlotting = { [] call f_fnc_zen_generateSlotting };

    [
        "[CAFE3] Slotting Generator",
        "Generate Slotting Code",
        _generateSlotting

    ] call zen_custom_modules_fnc_register;

};

#endif