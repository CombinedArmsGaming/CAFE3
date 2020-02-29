#include "macros.hpp"

CLIENT_ONLY;

_defaultKey = [219, [false, false, false]]; // Left Windows key

_keyDown =
{
    systemChat "push me :D";
    [] call f_fnc_onDowntimeSelectorHotkey;
};

["CA2", "DowntimeSelector", "Show Downtime Choices Menu", _keyDown, "", _defaultKey, false, 0, false] call CBA_fnc_addKeybind;


// CBA keybinds don't work in spectator unless we do this...
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
