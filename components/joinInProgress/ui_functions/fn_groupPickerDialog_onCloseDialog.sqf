#include "macros.hpp"

disableSerialization;

params ["_display", "_exitCode"];


_doTeleport =
{
    // 2020-06-02 TODO :: Copied from respawnTemplates/parts/tryTeleport.sqf.  De-duplicate.

    params ["_goto"];

    _onTeleportFailure =
    {
        hint "Failed to teleport to group leader.  You can now try again.";
        player setVariable ["f_var_mayTeleportToGroup", true, true];
    };

    player setVariable ["f_var_mayTeleportToGroup", false, true];

    _teleHandle = [player, _goto, _onTeleportFailure] spawn f_fnc_teleportPlayer;

    waitUntil { sleep 0.1; scriptDone _teleHandle };

};

private _doGearscript = missionNamespace getVariable ["f_var_groupPicker_forceGearscript_internal", false];
missionNamespace setVariable ["f_var_groupPicker_forceGearscript_internal", nil];


if (_exitCode == 2) exitWith {};


if (_exitCode == 1) then
{
    _groupList = _display displayCtrl IDC_GROUPPICKER_SQUADLIST;

    _selectedIdx = lbCurSel _groupList;
    _selectedGroupName = _groupList lbData _selectedIdx;

    private _playerSide = side group player;
    _groups = allGroups select {(side _x) isEqualTo _playerSide};

    _selectedGroup = _groups param [_groups findIf {(groupId _x) isEqualTo _selectedGroupName}, grpNull];
    private _countPriorToJoin = count units _selectedGroup;

    if (isNull _selectedGroup) exitWith
    {
        hint format ["Unable to join '%1', please try again.", _selectedGroupName];
    };

    [player] join _selectedGroup;

    // There may be a delay in the player's group membership changing properly in multiplayer.  Wait for the group membership to change here.
    [
        {
            params ["_doGearscript", "_group"];            
            (group player) isEqualTo _group
        },

        {
            [
                f_fnc_groupPickerDialog_alignPlayerRadios,
                _this,
                1            
            ] call CBA_fnc_waitAndExecute;
        },

        [_doGearscript, _selectedGroup],
    
        // Timeout (secs)
        10,
        f_fnc_groupPickerDialog_alignPlayerRadios
    
    ] call CBA_fnc_waitUntilAndExecute;

    _allowedToTeleport = player getVariable ["f_var_mayTeleportToGroup", false];

    if (_allowedToTeleport) then
    {
        _teleportCheckbox = _display displayCtrl IDC_GROUPPICKER_TELEPORTCHECKBOX;

        _isChecked = _teleportCheckbox ctrlChecked 0;

        if (_isChecked and {(_countPriorToJoin > 0) and (leader _selectedGroup isNotEqualTo player)}) then
        {
            [leader _selectedGroup] spawn _doTeleport;
        };

    };

};
