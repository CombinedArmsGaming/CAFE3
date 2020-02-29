#include "..\macros.hpp"

RUN_AS_ASYNC(f_fnc_downtimeDialog_setupButton);

#define SELECTED_EFFECTS _button ctrlSetFont "RobotoCondensedBold"; _button ctrlSetTextColor [1,1,1,1];
#define UNSELECTED_EFFECTS _button ctrlSetFont "RobotoCondensed"; _button ctrlSetTextColor [0.6,0.6,0.6,1];
#define SET_SELECTED_IF(CONDITION) if (CONDITION) then {SELECTED_EFFECTS} else {UNSELECTED_EFFECTS}

params ["_button"];

waitUntil {!isNil 'f_var_downtimeDialog_selectedActivity'};
waitUntil {!isNil 'f_var_downtimeDialog_selectedRespawnMode'};

switch (ctrlClassName _button) do
{
    case ("CA2_Downtime_SpectateButton"):
    {
        SET_SELECTED_IF(f_var_downtimeDialog_selectedActivity isEqualTo ACTIVITY_SPECTATE);
        f_var_downtimeDialog_buttonGroup_activity pushBack _button;
    };

    case ("CA2_Downtime_ControlButton"):
    {
        SET_SELECTED_IF(f_var_downtimeDialog_selectedActivity isEqualTo ACTIVITY_REMOTECONTROL);
        f_var_downtimeDialog_buttonGroup_activity pushBack _button;
    };

    case ("CA2_Downtime_NothingButton"):
    {
        SET_SELECTED_IF(f_var_downtimeDialog_selectedActivity isEqualTo ACTIVITY_NOTHING);
        f_var_downtimeDialog_buttonGroup_activity pushBack _button;
    };

    case ("CA2_Downtime_AlwaysRespawnButton"):
    {
        SET_SELECTED_IF(f_var_downtimeDialog_selectedRespawnMode isEqualTo RESPAWN_ALWAYS);
        f_var_downtimeDialog_buttonGroup_respawn pushBack _button;
    };

    case ("CA2_Downtime_RespawnWithConsentButton"):
    {
        SET_SELECTED_IF(f_var_downtimeDialog_selectedRespawnMode isEqualTo RESPAWN_CONSENTFIRST);
        f_var_downtimeDialog_buttonGroup_respawn pushBack _button;
    };

};

_button ctrlCommit 0;
