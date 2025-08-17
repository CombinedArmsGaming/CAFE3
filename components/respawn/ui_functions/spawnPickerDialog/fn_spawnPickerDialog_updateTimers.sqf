#include "macros.hpp"

disableSerialization;

/*
    Updates the death timer and the wave status info
*/

params ["_display"];

private _deathTimer = _display displayCtrl IDC_DEATH_TIMER;

private _timeDead = round (CBA_missionTime - (missionNamespace getVariable ["f_var_playerDeathTime", CBA_missionTime]));
private _minutesDead = floor (_timeDead / 60);
private _minutesStr = str _minutesDead;
if (_minutesDead < 10) then {_minutesStr = "0" + _minutesStr};
private _secondsDead = _timeDead % 60;
private _secondsStr = str _secondsDead;
if (_secondsDead < 10) then {_secondsStr = "0" + _secondsStr};

// DEBUG_FORMAT3_LOG("[RESPAWN] Dead for %1 (raw %2). Setting string to: %3", [_timeDead] call f_fnc_formatTimeDuration, _timeDead);
_deathTimer ctrlSetText (format ["Dead for:\n%1:%2", _minutesStr, _secondsStr]);

private _triggeredWavesActive = [RESPAWN_TRIGGERED_WAVE] call f_fnc_isRespawnModeActive;
if (_triggeredWavesActive) then {
    // Mostly stolen from the triggered wave dialog 
    private _timestamp = [playerSide] call f_fnc_getRespawnTimestampForTarget;
    private _sideRespawnDelay = [playerSide] call f_fnc_getSideRespawnDelayForTarget;
    private _timerAllowsRespawn = (CBA_missionTime >= (_timestamp + _sideRespawnDelay));

    private _waveTimer = _display displayCtrl IDC_WAVE_TEXT;
    private _str = "Wave status:\n";
    private _color = [0, 0, 1, 1];
    if (_timerAllowsRespawn) then
    {
        _str = _str + "Available to be called";
        _color = [1, 1, 0, 1];
        _buttonEnabled = true;
    }
    else
    {
        private _respawnWaveActive = (CBA_missionTime < _timestamp);

        if (_respawnWaveActive) then
        {
            private _timeRemaining = (_timestamp - CBA_missionTime) max 0;
            private _timeFormatted = [_timeRemaining] call f_fnc_formatTimeDuration;

            _str = _str + format ["Active (%1 left)", _timeFormatted];
            _color = [0, 1, 0, 1];
        }
        else
        {
            private _timeRemaining = ((_timestamp + _sideRespawnDelay) - CBA_missionTime) max 0;
            private _timeFormatted = [_timeRemaining] call f_fnc_formatTimeDuration;

            _str = _str + "Unavailable";
            _color = [1, 0, 0, 1];
        };
    };
    _waveTimer ctrlSetText _str;
    _waveTimer ctrlSetTextColor _color;
}