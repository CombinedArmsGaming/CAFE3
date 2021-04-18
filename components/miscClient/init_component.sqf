
#include "macros.hpp"

CLIENT_ONLY;

DEBUG_PRINT_LOG("initting client misc")


if IS_TRUE(f_var_showClassicIntroAtStart) then
{
    [] spawn f_fnc_sitautionInfoIntro;
};


[] spawn
{
    while {true} do
    {
        [player, 7500] call f_fnc_setRating;
        sleep 5;
    };

};


[] spawn
{
    waitUntil {uiSleep 1; !isNil "f_radios_loadedSettings"};

	_lastSide = "";

	while {true} do
	{
		_side = switch (side group player) do
		{
			case west: { "blufor" };
			case east: { "opfor" };
			case independent: { "indfor" };
			default { "indfor" };
		};

		if !(_side == "" or {_side == _lastSide}) then
		{
			[_side] call f_fnc_generateRadioList;
		};

		_lastSide = _side;

		sleep 5;

	};

};
