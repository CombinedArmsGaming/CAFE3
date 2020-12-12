#include "../macros.hpp"

params ["_display"];

_text = uiNamespace getVariable ["f_var_subtitleText", ""];
_doNotModifyText = uiNamespace getVariable ["f_var_subtitleTextIsStructured", false];

_textCtrl = _display displayCtrl IDC_SUBTITLETEXT_TEXT;

if !(_doNotModifyText) then
{
    _text = parseText ("<t shadow=""1"" shadowColor=""#000000"" align=""center"" size=""0.8"">" + _text + "</t>");
};

_textCtrl ctrlSetStructuredText _text;
