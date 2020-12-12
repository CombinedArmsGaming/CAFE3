#include "macros.hpp"

params ["_unit"];

if (f_radios_settings_acre2_disableRadios) exitWith {};

// If unit is in the list of units that receive an extra long-range radio, add another 148
if (_typeOfUnit in f_radios_settings_acre2_extraRadios) then
{
    DEBUG_PRINT_LOG("[Radios] Unit is in ER radio list: adding.")
    if (_unit canAdd f_radios_settings_acre2_extraRadio) then
    {
        _unit addItem f_radios_settings_acre2_extraRadio;
    }
    else
    {
        f_radios_settings_acre2_extraRadio call f_fnc_giveRadioAction;
    };

};
