#include "macros.hpp"

CLIENT_ONLY;

while {true} do
{
    private '_display';

    waitUntil
    {
        _display = findDisplay 60492;

        if (isNull _display) then { _display = findDisplay 60000; };

        !(isNull _display)
    };

    _button = _display ctrlCreate ["CA2_DowntimeButton_Spectator", 12343];
    _button ctrlCommit 0;

    waitUntil { isNull _display };

};
