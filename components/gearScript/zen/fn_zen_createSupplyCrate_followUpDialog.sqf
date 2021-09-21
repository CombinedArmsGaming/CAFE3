#include "../macros.hpp"

CLIENT_ONLY;

params ["_dialogValues", "_args"];
_dialogValues params ["_chosenFaction"];
_args params ["_position", "_unit"];

private _chosenSide = [_chosenFaction] call f_fnc_factionToSideName;
private _registry = CRATE_REGISTRY_DYNAMIC(toLower _chosenSide);

private _availableCrateModels =
[
    "B_supplyCrate_F",
    "C_IDAP_supplyCrate_F",
    "Box_NATO_Wps_F",
    "Box_NATO_WpsSpecial_F",
    "Box_Syndicate_Wps_F",
    "Box_Syndicate_Ammo_F",
    "Box_Syndicate_WpsLaunch_F"
];

private _crateModelNames = _availableCrateModels apply { getText (configfile >> "CfgVehicles" >> _x >> "displayName") };

private _dialogContents =
[
    ["COMBO", "Choose contents", [_registry, _registry, 0]]
];

if (isNull _unit) then
{
    _dialogContents pushBack ["COMBO", "Choose crate", [_availableCrateModels, _crateModelNames, 0]];
}
else
{
    _dialogContents pushBack ["LIST", "Object's inventory will be replaced", [[""], [""], 0, 0]];
};

[
    "Choose crate contents",
    _dialogContents,
    f_fnc_zen_createSupplyCrate_performAction,
    {},
    _args + _dialogValues

] call zen_dialog_fnc_create;
