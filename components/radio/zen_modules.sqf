call
{
    private _category = "[CAFE3] Radios";

    private _resetPlayer = { _this call f_fnc_zen_resetPlayerRadios };
    [_category, "Re-give radios to player", _resetPlayer] call zen_custom_modules_fnc_register;

    private _resetGroup = { _this call f_fnc_zen_resetGroupRadios };
    [_category, "Re-give radios to group", _resetGroup] call zen_custom_modules_fnc_register;

    private _channelsPlayer = { _this call f_fnc_zen_resetPlayerRadioChannels };
    [_category, "Reset radio channels for player", _channelsPlayer] call zen_custom_modules_fnc_register;

    private _channelsGroup = { _this call f_fnc_zen_resetGroupRadioChannels };
    [_category, "Reset group radio channels to default", _channelsGroup] call zen_custom_modules_fnc_register;

};
