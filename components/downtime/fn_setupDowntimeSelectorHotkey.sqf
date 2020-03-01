#include "macros.hpp"

CLIENT_ONLY;

_defaultKey = [219, [false, false, false]]; // Left Windows key

_keyDown =
{
    [] call f_fnc_onDowntimeSelectorHotkey;
};

["CA2", "DowntimeSelector", "Show Downtime Choices Menu", _keyDown, "", _defaultKey, false, 0, false] call CBA_fnc_addKeybind;


// CBA keybinds don't work in spectator unless we do this...
// BUB 2020-02-29 TODO :: Make this hack specific to this keybind only so people can't use *every* CBA keybind in spectator.
[] spawn
{
    while {true} do
    {
        sleep 1;

        private "_display";

        waitUntil
        {
            _display = findDisplay 60000;
            !(isNull _display)
        };

        _display displayAddEventHandler ["KeyDown", {call cba_events_fnc_keyHandlerDown}];
        _display displayAddEventHandler ["KeyUp", {call cba_events_fnc_keyHandlerUp}];

    };

};
