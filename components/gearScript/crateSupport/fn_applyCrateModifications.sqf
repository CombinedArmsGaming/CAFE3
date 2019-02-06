#include "..\macros.hpp"
#define HAS_ADV_BANDAGES(CONTAINER) [CONTAINER] call f_fnc_containsAdvancedMedical

params ["_contents"];

if (ace_medical_level == 1) then
{
    [_contents] call f_fnc_changeBandagesToBasic;
    [_contents] call f_fnc_changeFluidsToBlood;
    [_contents] call f_fnc_changeMedsToBasic;

};

if (ace_medical_level == 2) then
{
    if !(HAS_ADV_BANDAGES(_contents)) then
    {
        [_contents] call f_fnc_changeBandagesToAdvanced;
        [_contents] call f_fnc_changeMedsToAdvanced;

    };

};


_contents
