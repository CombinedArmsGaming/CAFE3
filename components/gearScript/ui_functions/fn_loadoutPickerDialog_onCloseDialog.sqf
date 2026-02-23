#include "macros.hpp"

disableSerialization;

params ["_display", "_exitCode"];

if (_exitCode == 1) then {
    private _loadoutsList = _display displayCtrl IDC_LOADOUTSLIST;
    if ((lbCurSel _loadoutsList) >= 0) then {
        private _loadoutName = _loadoutsList lbData (lbCurSel _loadoutsList);
        player setVariable ["f_var_assignGear", _loadoutName];
        DEBUG_FORMAT1_LOG("[LOADOUT_UI] Storing new chosen loadout %1", _loadoutName);
        
        _faction = toLower (player getVariable ["f_var_interactedLockerFaction", faction player]);
        private _loadoutArgs = [_loadout, _newUnit, _faction];
        [_loadoutName, player, _faction] call f_fnc_assignGear;
    };
};

player setVariable ["f_var_interactedLockerFaction", nil];
