call
{
    private _category = "[CAFE3] Respawn";

    private _makeRespawn = { _this call f_fnc_zen_createRespawnPoint };
    [_category, "Create Respawn Point", _makeRespawn] call zen_custom_modules_fnc_register;

    private _makeSquare = { _this call f_fnc_zen_createRespawnSquare };
    [_category, "Respawn Player at Cursor", _makeSquare] call zen_custom_modules_fnc_register;

    private _changeTickets = { _this call f_fnc_zen_changeTickets };
    [_category, "Change Respawn Tickets", _changeTickets] call zen_custom_modules_fnc_register;

    private _allowRespawn = { _this call f_fnc_zen_allowImmediateRespawn };
    [_category, "Allow Immediate Respawn for Player", _allowRespawn] call zen_custom_modules_fnc_register;

};
