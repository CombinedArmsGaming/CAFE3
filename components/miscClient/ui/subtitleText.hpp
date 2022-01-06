#include "../ui_macros.hpp"

class CAFE_SubtitleText
{
    idd = IDD_SUBTITLETEXT;

	movingEnable = false;
	enableSimulation = true;

    fadein = 0.5;
    duration = 13;
	fadeout = 3;

    onLoad = "_this call f_fnc_subtitleText_onLoad;";

    class ControlsBackground
    {
        class SubtitleText: CAFE_DefaultStructuredText
        {
        	idc = IDC_SUBTITLETEXT_TEXT;
        	x = 0 * GUI_GRID_W + GUI_GRID_X;
        	y = 20 * GUI_GRID_H + GUI_GRID_Y;
        	w = 40 * GUI_GRID_W;
        	h = 3.2 * GUI_GRID_H;
        	text = "";
        };

    };

};
