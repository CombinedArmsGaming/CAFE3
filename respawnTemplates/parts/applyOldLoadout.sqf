_applyOldLoadout =
{
    WAIT_UNTIL_MISSION_STARTED();

    params ["_unit", "_corpse"];

    [] call f_fnc_removeRadios;

    _loadout = (_unit getVariable "f_var_assignGear");
    if (isNil '_loadout') then {_loadout = (_corpse getVariable "f_var_assignGear")};
    if (isNil '_loadout') then {_loadout = "default"};

    _unit setVariable ["f_var_assignGear_done", false, true];

    [_loadout, _unit] spawn f_fnc_assignGear;

};
