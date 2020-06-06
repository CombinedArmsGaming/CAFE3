#include "macros.hpp"

// CA - Filling listbox for the ca marker management system.
_alreadyinlist = [];

while {true} do
{
    disableSerialization;

    _display = findDisplay 1996;
    _lb1ctrl = _display displayCtrl 1500;

    _side = side player;
    _groupVar = toLower format ["f_group_spectators_%1", _side];
    _specGroup = missionNamespace getVariable [_groupVar, grpNull];

    _specPlayers = (units _specGroup);
    _listplayers = _specplayers - _alreadyinlist;

    {
         _alreadyinlist pushBackUnique _x;
         _lb1ctrl lbAdd (name _x);
         _lb1ctrl lbSetData [_forEachIndex, (name _x)];

    } forEach _listplayers;

    _waves = _display displayCtrl 1004;
    _noplayers = _display displayCtrl 1005;
    _timer = _display displayCtrl 1006;

    _waves ctrlSetText ('Waves left: ' + str RESPAWN_WAVES(_side));
    _noplayers ctrlSetText (str (count _specPlayers) + ' players are waiting.');

    _time = (RESPAWN_WAVE_DURATION(_side) + RESPAWN_WAVE_COOLDOWN(_side) + LAST_RESPAWN_TIME(_side) - time);

    if (0 > _time) then
    {
        _timer ctrlSetText ('Respawn wave available');
    }
    else
    {
        // 2020-06-06 TODO :: Split out into helper func if needed elsewhere.
        _timeString = "";

        if (_time > (60*60)) then
        {
            _timeString = format ["%1h %2m %3s", floor (_time / (60*60)), floor ((_time / 60) mod 60), floor (_time mod 60)];
        };
        if ((_timeString isEqualTo "") and {_time > 60}) then
        {
            _timeString = format ["%1m %2s", floor ((_time / 60) mod 60), floor (_time mod 60)];
        }
        else
        {
            _timeString = format ["%1s", floor _time];
        };

        _timer ctrlSetText (_timeString + ' until wave available');

    };

    uiSleep 1;
};
