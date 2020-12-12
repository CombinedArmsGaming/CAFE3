#include "macros.hpp"
SERVER_ONLY;

// Server configuration group
// Includes all config scripts needed for the server.

// Debug settings
#include "..\internals\debug.sqf"

// Radios
#include "..\..\..\configuration\radios\acre.sqf"

// Insignia
#include "..\internals\insigniaDefinition.sqf"

// Gearscript2
#include "..\internals\gearScript.sqf"

// Identity Translation
#include "..\internals\identityTranslation.sqf"
