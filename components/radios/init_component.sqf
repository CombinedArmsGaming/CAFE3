
#include "macros.hpp"

DEBUG_PRINT_LOG("initting radios")

// F3 - Radio Framework initialisation
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

#ifdef RADIO_ACRE

    #include "..\..\configuration\radios\acre.sqf"

#endif

#ifdef RADIO_TFR

    #include "..\..\configuration\radios\tfr.sqf"

#endif

[] spawn f_fnc_radioInit;

// ====================================================================================
