#include "macros.hpp"
/*
    Deselect the current selection of a listbox without affecting the scrollbar position
*/

disableSerialization;

params ["_control"];

private _scrollPos = ctrlScrollValues _control;
_control lbSetCurSel -1;
_control ctrlSetScrollValues _scrollPos;