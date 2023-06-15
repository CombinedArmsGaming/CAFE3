call
{
    private _category = "[CAFE3] Logistics";

    [
        _category,
        "Create / refill supply crate",
        f_fnc_zen_createSupplyCrate

    ] call zen_custom_modules_fnc_register;

    [
        _category,
        "Create Loadout Locker",
        f_fnc_zen_createLoadoutLocker

    ] call zen_custom_modules_fnc_register;

    [
        _category,
        "Assign Loadout",
        f_fnc_zen_assignLoadout
    ] call zen_custom_modules_fnc_register;
};
