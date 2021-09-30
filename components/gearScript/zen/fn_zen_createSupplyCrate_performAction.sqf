#include "../macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_zen_createSupplyCrate_performAction);

params ["_dialogValues", "_args"];
_dialogValues params ["_chosenGear", "_chosenCrate"];
_args params ["_position", "_unit", "_chosenFaction"];

if (isNull _unit) then
{
    ["Creating a '%1' with an inventory of '%2'.", _chosenCrate, _chosenGear] call zen_common_fnc_showMessage;

    _unit = _chosenCrate createVehicle [0,0,0];
    _unit allowDamage false;
    _unit spawn {sleep 5; _this allowDamage true};
    [_unit] remoteExec ["f_fnc_addObjectsToAllZeuses", 2];

    sleep 1;

    [_chosenGear, _unit, _chosenFaction] call f_fnc_assignGear;

    _unit setPosASL (_position vectorAdd [0,0,0.1]);
}
else
{
    ["Replacing inventory of '%1' with contents of '%2'.", _unit, _chosenGear] call zen_common_fnc_showMessage;
    [_chosenGear, _unit, _chosenFaction] call f_fnc_assignGear;
};
