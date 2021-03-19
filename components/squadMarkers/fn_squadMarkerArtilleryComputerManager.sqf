
#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_squadMarkerArtilleryComputerManager);

WAIT_UNTIL_SETTINGS_READY();

// TODO 2021-03-18 :: Find a way to only start this loop if the player gets into an arty piece (or at least wait until an arty piece is created).

_findArtyDisplay =
{
    _artyDisplay = displayNull;

    _artyDisplay = {
        _fireButton = _x displayCtrl 501;
        if ((ctrlText _fireButton) == "FIRE") exitWith { _x };

    } foreach (allDisplays select {ctrlIDD _x isEqualTo -1});

    _artyDisplay
};


_hookArtyDisplay =
{
    if (_this getVariable ["f_var_squadMarker_eventId", -1] >= 0) exitWith {};

    _mapControl = _this displayCtrl 500;

    _eventId = _mapControl ctrlAddEventHandler
	[
		"Draw",
		"_this call f_fnc_drawSquadMarkers"
	];

    _this setVariable ["f_var_squadMarker_eventId", _eventId];
};


while {true} do
{
    waitUntil
    {
        uiSleep 1;
        shownArtilleryComputer
    };

    _artyDisplay = [] call _findArtyDisplay;

    if !(isNull _artyDisplay) then
    {
        _artyDisplay call _hookArtyDisplay;
    };

    waitUntil
    {
        !shownArtilleryComputer
    };

};

systemChat "run thru";
