#include "macros.hpp"

params ["_unit"];

if (f_radios_settings_acre2_disableRadios) exitWith {};

// If unit is in the list of units that receive a backpack radio, then add a 117F
if (_typeOfUnit in f_radios_settings_acre2_BackpackRadios) then
{
    DEBUG_PRINT_LOG("[Radios] Unit is in Backpack radio list: adding.")
    if (_unit canAdd f_radios_settings_acre2_BackpackRadio) then
    {
        _unit addItem f_radios_settings_acre2_BackpackRadio;
    }
    else
    {
        f_radios_settings_acre2_BackpackRadio call f_fnc_giveRadioAction;
    };

};
