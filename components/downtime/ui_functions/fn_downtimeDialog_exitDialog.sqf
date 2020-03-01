#include "..\macros.hpp"

params ["_display", "_exitCode"];

if (_exitCode == 3) then
{
    f_var_downtimeActivity = f_var_downtimeDialog_selectedActivity;
    f_var_downtimeRespawnMode = f_var_downtimeDialog_selectedRespawnMode;
};

f_var_downtimeDialog_selectedActivity = nil;
f_var_downtimeDialog_selectedRespawnMode = nil;

if IS_TRUE(f_var_downtimeDialogOpenedOnTop) then
{
    f_var_downtimeExperienceActive = false;
};

f_var_downtimeActivitySelector_isOpen = nil;
