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

    _time = TIME_UNTIL_RESPAWN_READY(_side);

    if (0 > _time) then
    {
        _timer ctrlSetText ('Respawn wave available');
    }
    else
    {
        _timeString = [_time] call f_fnc_formatTimeDuration;

        _timer ctrlSetText (_timeString + ' until wave available');

    };

    uiSleep 1;
};
