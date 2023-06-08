#include "../macros.hpp"

CLIENT_ONLY;

params ["_position", "_unit"];

if ((isNull _unit) or !(_unit isKindOf "CAManBase")) exitWith
{
	["No unit selected"] call zen_common_fnc_showMessage;
};

private _faction = faction _unit;
private _gearVariant = [_faction] call f_fnc_factionToSideName;
private _registry = LOADOUT_REGISTRY_DYNAMIC(_gearVariant);

if (_registry isEqualTo []) exitWith
{
    ["No loadouts available for this unit's side."] call zen_common_fnc_showMessage;
};

private _values = _registry apply { toUpper _x };

private _assignLoadout =
{
    params ["_dialogValues", "_args"];
    _dialogValues params ["_typeOfUnit"];
    _args params ["_position", "_unit"];

    [_typeOfUnit,_unit] call f_fnc_assignGear;
};

[
    "Assign Loadout",
    [
    	["LIST", "Choose Loadout", [_registry, _values, 0, 5]]
    ],
    _assignLoadout,
    {},
    _this

] call zen_dialog_fnc_create;
