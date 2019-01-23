#include "macros.hpp"

if (isNil 'f_var_ftMarkersDrawHandlerId') then
{
	DEBUG_PRINT_LOG("[FTMarkers-2] Creating handler.")

	f_var_ftMarkersDrawHandlerId = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler
	[
		"Draw",
		"_this call f_fnc_drawFireteamMarkers"
	];

};
