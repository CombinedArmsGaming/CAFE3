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
        "Give Loadout",
        f_fnc_zen_assignGear
    ] call zen_custom_modules_fnc_register;
};
