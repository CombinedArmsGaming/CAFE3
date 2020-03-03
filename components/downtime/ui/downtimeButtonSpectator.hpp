#include "..\macros.hpp"

class CA2_DowntimeButton_Spectator: CA2_DefaultButton
{
    onLoad = "f_var_showingDowntimeButton = true; _this spawn f_fnc_downtimeButtonSpectator_onLoad;";
    onDestroy = "f_var_showingDowntimeButton = false;";

	idc = 12343;
	text = "Open Downtime Menu";
	x = 15.3 * GUI_GRID_W + GUI_GRID_X;
	y = 26.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;

    onButtonClick = "[true] call f_fnc_downtimeActivitySelector;";

};
