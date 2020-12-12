#include "../macros.hpp"

// Takes structured text or a regular string.
// If providing a string, ensure newlines are represented by <br/> instead of \n.
// If providing structured text, set second param to true if text provides its own style, otherwise it will be wrapped in a standard subtitle style.

params ["_text", ["_doNotModifyText", false]];

// Why the fuck isn't there a way to send constructor parameters to a UI element?
isNil
{
    uiNamespace setVariable ["f_var_subtitleText", _text];
    uiNamespace setVariable ["f_var_subtitleTextIsStructured", _doNotModifyText];
    "CA2_SubtitleText" cutRsc ["CA2_SubtitleText", "PLAIN", -1, false];
}
