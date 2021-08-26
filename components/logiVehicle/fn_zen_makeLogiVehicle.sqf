#include "macros.hpp"

CLIENT_ONLY;

params ["_position", "_object"];

if (isNull _object) exitWith
{
    ["No object found: use this upon an existing object."] call zen_common_fnc_showMessage;
};


private _existingLogiType = GET_LOGITYPE(_object);

if (_existingLogiType isNotEqualTo "") exitWith
{
    [_object, _existingLogiType] remoteExec ["f_fnc_setLogiVehicle", 2];
    ["Logi vic of type '%1' has been restocked.", _existingLogiType] call zen_common_fnc_showMessage;
};


private _logiTypes = [];
private _logiReadableNames = [];

{
    private _side = GET_FACTION_DYNAMIC(_x);
    private _sideReadable = [_side] call f_fnc_factionToSideName;

    _logiTypes pushBack _x;
    _logiReadableNames pushBack (format ["%1 (%2)", _x, _sideReadable]);

} forEach LOGI_REGISTRY;


private _onConfirm =
{
    params ["_values", "_args"];


    // Check this again here in case another zeus has set up this vic during the dialog.
    private _existingLogiType = GET_LOGITYPE(_object);

    if (_existingLogiType isNotEqualTo "") exitWith
    {
        [_object, _existingLogiType] remoteExec ["f_fnc_setLogiVehicle", 2];
        ["Logi vic of type '%1' has been restocked.", _existingLogiType] call zen_common_fnc_showMessage;
    };


    private _chosenLogiType = _values#0;
    private _object = _args;

    [_object, _chosenLogiType] remoteExec ["f_fnc_setLogiVehicle", 2];

    ["Configuring this object as a new '%1' logi vic...", _chosenLogiType] call zen_common_fnc_showMessage;

};


private _dialogContentConfig =
[
    [
        "COMBO",
        ["Logi vic type", "Choose the kind of logi vic that this vehicle should be configured as."],
        [_logiTypes, _logiReadableNames, 0],
        false
    ]
];

private _dialogConfig =
[
    "Choose logi vic type",
    _dialogContentConfig,
    _onConfirm,
    {},
    _object
];

_dialogConfig call zen_dialog_fnc_create;
