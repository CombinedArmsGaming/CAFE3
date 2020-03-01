#include "..\macros.hpp"

class CA2_DowntimeButton
{
    idd = 12343;
    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "f_var_showingDowntimeButton = true;";
    onUnload = "f_var_showingDowntimeButton = false;";

    class Controls
    {

        class CA2_DowntimeButton_Button: CA2_DefaultButton
        {
        	idc = 1600;
        	text = "Open Downtime Menu";
        	x = 15.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 23 * GUI_GRID_H + GUI_GRID_Y;
        	w = 9 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;

            onButtonClick = "_dtButton = findDisplay 12343; if !(isNull _dtButton) then {_dtButton closeDisplay 2;}; [true] call f_fnc_downtimeActivitySelector;";
        };

    };

};
