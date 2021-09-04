#include "../macros.hpp"

CLIENT_ONLY;

params ["_position", "_unit"];

if ((!isNull _unit) and {_unit isKindOf "CAManBase"}) exitWith
{
    ["Cannot use this module on units.  Try on ground, vehicles or containers."] call zen_common_fnc_showMessage;
};

private _potentialSides =
[
    ["BLUFOR",    "blu_f"],
    ["OPFOR",     "opf_f"],
    ["INDFOR",    "ind_f"],
    ["Civilian",  "civ_f"],
    ["Guerrilla", "blu_g_f"]
];

private _sidesInUse = _potentialSides select { CRATE_REGISTRY_DYNAMIC(toLower (_x # 0)) isNotEqualTo [] };

[
    "Choose Gearscript Side",
    [
    	["LIST", "Choose gearscript side", [_sidesInUse apply {_x#1}, _sidesInUse apply {_x#0}, 0, (count _sidesInUse)]]
    ],
    f_fnc_zen_createSupplyCrate_followUpDialog,
    {},
    _this

] call zen_dialog_fnc_create;
