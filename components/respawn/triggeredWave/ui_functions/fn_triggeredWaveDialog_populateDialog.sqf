#include "macros.hpp"

disableSerialization;

params ["_display"];

private _ticketsEnabled = [RESPAWN_TICKETS] call f_fnc_isRespawnModeActive;

if (_ticketsEnabled) then
{
    private _playersTitle = _display displayCtrl IDC_TRIGGEREDWAVE_DIALOG_PLAYERSTITLE;

    _playersTitle ctrlSetText "Players (+ personal tickets):";
};


f_fnc_triggeredWaveDialog_isPlayerRespawnable =
{
    private _playerSide = _x getVariable ["f_var_playerSide", side _x];
    (_playerSide isEqualTo playerSide) and {!alive _x}
};


// Populate player list
f_fnc_triggeredWaveDialog_populatePlayerList = 
{
    params ["_display", "_ticketsEnabled"];

    private _playerList = _display displayCtrl IDC_TRIGGEREDWAVE_DIALOG_PLAYERLIST;

    lbClear _playerList;

    {
        private _playerText = name _x;

        if (_ticketsEnabled) then
        {
            private _playerTickets = [_x] call BIS_fnc_respawnTickets;

            if (_playerTickets > 0) then
            {
                _playerText = format ["%1 (%2)", _playerText, _playerTickets];
            };
        };

        _playerList lbAdd _playerText;

    } forEach (allPlayers select f_fnc_triggeredWaveDialog_isPlayerRespawnable);

};



// Populate ticket count
f_fnc_triggeredWaveDialog_populateTicketCount = 
{
    params ["_display", "_ticketsEnabled"];

    private _ticketsText = _display displayCtrl IDC_TRIGGEREDWAVE_DIALOG_TICKETSLEFT;
    
    if !(_ticketsEnabled) exitWith
    {
        _ticketsText ctrlSetTextColor [0.7, 0.7, 0.7, 1];
        _ticketsText ctrlSetFont "RobotoCondensedLight";
        _ticketsText ctrlSetText "(disabled)";
    };

    _ticketsText ctrlSetTextColor [1, 1, 1, 1];
    _ticketsText ctrlSetFont "RobotoCondensed";

    private _ticketsForSide = [playerSide] call BIS_fnc_respawnTickets;
    private _sideAsReadable = [playerSide] call f_fnc_sideToString;
    private _ticketsAsText = format ["%1 (%2)", _ticketsForSide, toUpper _sideAsReadable];

    _ticketsText ctrlSetText _ticketsAsText;

};



// Manage the state and tooltip of the respawn button.
f_fnc_triggeredWaveDialog_manageRespawnButton = 
{
    params ["_display", "_ticketsEnabled"];

    private _triggeredRespawnEnabled = [RESPAWN_TRIGGERED_WAVE] call f_fnc_isRespawnModeActive;
    private _respawnButton = _display displayCtrl IDC_TRIGGEREDWAVE_DIALOG_RESPAWNBUTTON;

    if !(_triggeredRespawnEnabled) exitWith
    {
        _respawnButton ctrlEnable false;
        _respawnButton ctrlSetTooltip "Triggered waves are disabled.  This dialog cannot be used.";
    };

    private _timestamp = [playerSide] call f_fnc_getRespawnTimestampForTarget;
    private _sideRespawnDelay = [playerSide] call f_fnc_getSideRespawnDelayForTarget;
    private _timerAllowsRespawn = (CBA_missionTime >= (_timestamp + _sideRespawnDelay));

    private _tooltipText = "";
    private _buttonEnabled = false;

    if (_ticketsEnabled) then
    {
        private _ticketsForSide = [playerSide] call BIS_fnc_respawnTickets;

        if ((_ticketsForSide <= 0) and _timerAllowsRespawn) exitWith
        {
            _tooltipText = "Side tickets depleted.  If players have personal tickets, they can still respawn.";
            _buttonEnabled = true;
        };
    };

    if (_tooltipText isEqualTo "") then
    {
        if (_timerAllowsRespawn) then
        {
            _tooltipText = "A respawn wave is available to be called.";
            _buttonEnabled = true;
        }
        else
        {
            private _respawnWaveActive = (CBA_missionTime < _timestamp);

            if (_respawnWaveActive) then
            {
                private _timeRemaining = (_timestamp - CBA_missionTime) max 0;
                private _timeFormatted = [_timeRemaining] call f_fnc_formatTimeDuration;

                _tooltipText = format ["A respawn wave is active (%1 remaining).", _timeFormatted];
                _buttonEnabled = false;
            }
            else
            {
                private _timeRemaining = ((_timestamp + _sideRespawnDelay) - CBA_missionTime) max 0;
                private _timeFormatted = [_timeRemaining] call f_fnc_formatTimeDuration;

                _tooltipText = format ["Respawn wave unavailable (wait another %1).", _timeFormatted];
                _buttonEnabled = false;
            };
        };
    };

    _respawnButton ctrlEnable _buttonEnabled;
    _respawnButton ctrlSetTooltip _tooltipText;

};



f_fnc_triggeredWaveDialog_refreshWaveDialog = 
{
    params ["_display", "_ticketsEnabled"];

    // Refresh wave dialog.
    [
        // Script
        {
            if !(isNull (_this#0)) exitWith
            {
                _this call f_fnc_triggeredWaveDialog_populatePlayerList;
                _this call f_fnc_triggeredWaveDialog_populateTicketCount;
                _this call f_fnc_triggeredWaveDialog_manageRespawnButton;
                _this call f_fnc_triggeredWaveDialog_refreshWaveDialog;
            };
        },

        // Arguments
        _this,

        // Delay (secs)
        1

    ] call CBA_fnc_waitAndExecute;
};

[_display, _ticketsEnabled] call f_fnc_triggeredWaveDialog_populatePlayerList;
[_display, _ticketsEnabled] call f_fnc_triggeredWaveDialog_populateTicketCount;
[_display, _ticketsEnabled] call f_fnc_triggeredWaveDialog_manageRespawnButton;
[_display, _ticketsEnabled] call f_fnc_triggeredWaveDialog_refreshWaveDialog;
