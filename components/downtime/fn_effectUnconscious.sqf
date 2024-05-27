// Provide a wrapper around ace_medical_feedback_fnc_effectUnconscious to stop unconscious effects being applied when in spectator.
// This... isn't great.  It's only valid for as long as the underlying function does not fundamentally change.  Keep an eye on this.

#include "macros.hpp"

params ["_enable", "_mode"];

if (_enable and {IS_TRUE(ace_spectator_isSet)}) exitWith {};

_this call ace_medical_feedback_fnc_effectUnconscious_original
