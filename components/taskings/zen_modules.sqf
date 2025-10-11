#ifdef USE_ZEUS_TASKING_MODULES 
    private _category = "[CAFE3] Taskings";
    call
    {
        [
            _category,
            "Create Tasking",
            {
                [] remoteExecCall ["f_fnc_tasking_create"];
            }
        ] call zen_custom_modules_fnc_register;
        [
            _category,
            "Set Tasking State",
            {
                [] remoteExecCall ["f_fnc_tasking_state"];
            }
        ] call zen_custom_modules_fnc_register;
        [
            _category,
            "Remove Tasking",
            {
                [] remoteExecCall ["f_fnc_tasking_remove"];
            }
        ] call zen_custom_modules_fnc_register;
    };
#endif