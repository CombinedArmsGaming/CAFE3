#include "macros.hpp"


profileNamespace setVariable [FULL_KILL_LOG_KEY_CLIENT, nil];


if !(isNil 'f_var_currentDisplayedKillLogMarkers') then
{
	for "_i" from 0 to f_var_currentDisplayedKillLogMarkers do
	{
		_markerName = format ["f_killmarker_%1", _i];
		deleteMarker _markerName;
	};

};

f_var_currentDisplayedKillLogMarkers = nil;


#define returnval 'Deleted all kill logs for ##KILL_LOG_NAME##.'
returnval
