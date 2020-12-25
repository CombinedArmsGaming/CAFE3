#include "macros.hpp"

_keepHookAlive =
{
	params ["_hookFactory", "_fncGetControl", "_readableControlName"];

	while {true} do
	{
		_hookedCtrl = [] call _fncGetControl;
		[] call _hookFactory;

		waitUntil
		{
			sleep 5;
			_curCtrl = [] call _fncGetControl;
			!(_hookedCtrl isEqualTo _curCtrl)
		};

		DEBUG_FORMAT2_LOG("[SquadMarkers] Detected change in control for %1 at time %2, creating new hook.",_readableControlName,time)

		if !(isNull _hookedCtrl) then
		{
			_hookedCtrl ctrlRemoveEventHandler ["Draw", f_var_ftMarkersDrawHandlerId_RscDiary];
		};
	};
};




_createMapHook =
{
	waitUntil
	{
		sleep 1;
		_display = (uiNamespace getVariable "RscDiary");
		!( (isNull _display) or {isNull (_display displayCtrl 51)} )
	};

	DEBUG_PRINT_LOG("[FTMarkers-2] Creating handler for map.")

	f_var_ftMarkersDrawHandlerId_RscDiary = ((uiNamespace getVariable "RscDiary") displayCtrl 51) ctrlAddEventHandler
	[
		"Draw",
		"_this call f_fnc_drawFireteamMarkers"
	];

};

_getMap = { ((uiNamespace getVariable "RscDiary") displayCtrl 51) };

[_createMapHook, _getMap, "Map"] spawn _keepHookAlive;




_createGpsHook =
{
	waitUntil
	{
		sleep 1;
		_display = (uiNamespace getVariable "RscCustomInfoMiniMap");
		!( (isNull _display) or {isNull (_display displayCtrl 101)} )
	};

	DEBUG_PRINT_LOG("[FTMarkers-2] Creating handler for GPS.")

	f_var_ftMarkersDrawHandlerId_RscCustomInfoMiniMap = ((uiNamespace getVariable "RscCustomInfoMiniMap") displayCtrl 101) ctrlAddEventHandler
	[
		"Draw",
		"_this call f_fnc_drawFireteamMarkers"
	];

};

_getGps = { ((uiNamespace getVariable "RscCustomInfoMiniMap") displayCtrl 101) };

[_createGpsHook, _getGps, "GPS"] spawn _keepHookAlive;
