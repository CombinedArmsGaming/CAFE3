// Make sure the player has stopped controlling any AI and all relevant variables are cleared.

#include "..\macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_stopRemoteControlUnit);

if (isNil 'bis_fnc_moduleRemoteControl_unit') exitWith {};

_unit = bis_fnc_moduleRemoteControl_unit;

objNull remoteControl _unit;
player switchCamera cameraView;

bis_fnc_moduleRemoteControl_unit = nil;
_unit setVariable ["bis_fnc_moduleRemoteControl_owner", nil, true];
