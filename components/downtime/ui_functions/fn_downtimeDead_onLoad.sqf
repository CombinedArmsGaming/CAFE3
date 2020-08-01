#include "../macros.hpp"

params ["_display"];

_subtitle = _display displayCtrl IDC_DOWNTIMEDEAD_SUBTITLE;
_text = "";
_side = side player;

_respawnsLeft = RESPAWN_WAVES(_side);

if (_respawnsLeft <= 0) then
{
    _text = "No respawn waves remain.";
}
else
{
    _time = TIME_UNTIL_RESPAWN_READY(_side);

    if (_time > 5) then
    {
        _timeString = [_time] call f_fnc_formatTimeDuration;

        _text = format ["%1 until respawn is available.", _timeString];
    }
    else
    {
        _text = "Respawn waves are available to leaders.";
    };

};

_subtitle ctrlSetText _text;
