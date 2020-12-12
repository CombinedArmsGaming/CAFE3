#include "macros.hpp"

params ["_unit"];

if (f_radios_settings_acre2_disableRadios) exitWith {};

// Everyone gets a short-range radio by default
if (isnil "f_radios_settings_acre2_shortRange") then
{
    DEBUG_PRINT_LOG("[Radios] Everyone gets a SR radio: adding.")
    if (_unit canAdd f_radios_settings_acre2_standardSHRadio) then
    {
        _unit addItem f_radios_settings_acre2_standardSHRadio;
    }
    else
    {
        f_radios_settings_acre2_standardSHRadio call f_fnc_giveRadioAction;
    };
}
else
{
    if (_typeOfUnit in f_radios_settings_acre2_shortRange) then
    {
        DEBUG_PRINT_LOG("[Radios] Unit is in SR radio list: adding.")
        if (_unit canAdd f_radios_settings_acre2_standardSHRadio) then
        {
            _unit addItem f_radios_settings_acre2_standardSHRadio;
        }
        else
        {
            f_radios_settings_acre2_standardSHRadio call f_fnc_giveRadioAction;
        };

    };

};
