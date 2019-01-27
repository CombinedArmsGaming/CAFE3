#include "macros.hpp"

waitUntil
{
	_display = findDisplay 12;
	!( (isNull _display) or {isNull (_display displayCtrl 51)} )
};


if (isNil 'f_var_squadMarkersDrawHandlerId') then
{
	DEBUG_PRINT_LOG("[SquadMarkers] Creating handler.")

	f_var_squadMarkersDrawHandlerId = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler
	[
		"Draw",
		"_this call f_fnc_drawSquadMarkers"
	];

};
