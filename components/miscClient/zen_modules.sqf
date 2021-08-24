
// Mission intro module

private _playIntro = { [] call f_fnc_zen_playIntro };

[
    "[CA2] Misc",
    "Play Mission Intro",
    _playIntro

] call zen_custom_modules_fnc_register;


// Wound Randomly Modules

private _category = "[CA2] Medical";

private _woundUnit = { _this#1 call f_fnc_zen_woundUnitRandomly };

[
    _category,
    "Wound Unit Randomly",
    _woundUnit

] call zen_custom_modules_fnc_register;


_woundUnit = { _this#1 call f_fnc_zen_woundUnitRandomlyAdvanced };

[
    _category,
    "Wound Unit (Advanced)",
    _woundUnit

] call zen_custom_modules_fnc_register;


_woundUnit = { _this#1 call f_fnc_zen_woundGroupRandomly };

[
    _category,
    "Wound Group Randomly",
    _woundUnit

] call zen_custom_modules_fnc_register;


_woundUnit = { _this#1 call f_fnc_zen_woundGroupRandomlyAdvanced };

[
    _category,
    "Wound Group (Advanced)",
    _woundUnit

] call zen_custom_modules_fnc_register;
