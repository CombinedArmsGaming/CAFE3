#include "macros.hpp"

params ["_unit"];

if (f_radios_settings_acre2_disableRadios) exitWith {};

// If unit is in the above list, add a 148
if (_typeOfUnit in f_radios_settings_acre2_longRange) then
{
    DEBUG_PRINT_LOG("[Radios] Unit is in LR radio list: adding.")
    if (_unit canAdd f_radios_settings_acre2_standardLRRadio) then
    {
        _unit addItem f_radios_settings_acre2_standardLRRadio;
    }
    else
    {
        f_radios_settings_acre2_standardLRRadio call f_fnc_giveRadioAction;
    };

};
