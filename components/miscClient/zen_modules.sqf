call
{
    // Mission intro module

    private _playIntro = { [] call f_fnc_zen_playIntro };

    [
        "[CAFE3] Misc",
        "Play Mission Intro",
        _playIntro

    ] call zen_custom_modules_fnc_register;

    
    private _disableAI = { [_this#1] call f_fnc_zen_toggleAIPath };

    [
        "[CAFE3] Misc",
        "Toggle AI Pathing ability",
        _disableAI

    ] call zen_custom_modules_fnc_register;

    // Wound Randomly Modules

    private _category = "[CAFE3] Medical";

    private _woundUnit = { [_this#1] call f_fnc_zen_woundUnitRandomly };

    [
        _category,
        "Wound Unit Randomly",
        _woundUnit

    ] call zen_custom_modules_fnc_register;


    _woundUnit = { [_this#1] call f_fnc_zen_woundUnitRandomlyAdvanced };

    [
        _category,
        "Wound Unit (Advanced)",
        _woundUnit

    ] call zen_custom_modules_fnc_register;


    _woundUnit = { [_this#1] call f_fnc_zen_woundGroupRandomly };

    [
        _category,
        "Wound Group Randomly",
        _woundUnit

    ] call zen_custom_modules_fnc_register;


    _woundUnit = { [_this#1] call f_fnc_zen_woundGroupRandomlyAdvanced };

    [
        _category,
        "Wound Group (Advanced)",
        _woundUnit

    ] call zen_custom_modules_fnc_register;


    private _immersiveHeal = { [_this#1] call f_fnc_zen_immersiveRevive };

    [
        _category,
        "Immersive Revive (Unit)",
        _immersiveHeal

    ] call zen_custom_modules_fnc_register;

    //Immersive Revive actions
    private _immersiveReviveCode =
    {
        [_this#5] call f_fnc_zen_immersiveRevive;
    };

    private _immersiveReviveCondition =
    {
        (_objects findIf {isPlayer _x} != -1);
    };

    private _immersiveReviveAction =
    [
        "immersiveRevive",
        "[CAFE3] Immersive Revive",
        "\x\ZEN\addons\context_actions\ui\medical_cross_ca.paa",
        _immersiveReviveCode,
        _immersiveReviveCondition
    ] call zen_context_menu_fnc_createAction;

    [_immersiveReviveAction, ["HealUnits"], 0] call zen_context_menu_fnc_addAction;

    //Heal wounds
    private _healWounds = { [_this#1] call f_fnc_zen_healWounds };

    [
        _category,
        "Heal Wounds Only (Unit)",
        _healWounds

    ] call zen_custom_modules_fnc_register;


    private _fixOverdose = { [_this#1] call f_fnc_zen_fixOverdose };

    [
        _category,
        "Fix Overdose (Unit)",
        _fixOverdose

    ] call zen_custom_modules_fnc_register;


    // Jammer Modules

    if !(isNil 'kyk_ew_fnc_broadcastJammerAdd') then
    {
        _category = "[CAFE3] Electronic Warfare";

        private _jammerCreate = { [_this#1] call f_fnc_zen_createJammer };

        [
            _category,
            "Add Jammer to Object",
            _jammerCreate

        ] call zen_custom_modules_fnc_register;


        private _jammerRemove = { [_this#1] call f_fnc_zen_removeJammers };

        [
            _category,
            "Remove Jammers from Object",
            _jammerRemove

        ] call zen_custom_modules_fnc_register;

    };

};
