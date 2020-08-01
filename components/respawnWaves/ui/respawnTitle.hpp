#include "../ui_macros.hpp"

class CA2_RespawnTitle
{
    idd = 13176;

	movingEnable = false;
	enableSimulation = true;

    fadein = 1;
    duration = 7;
	fadeout = 3;

    onLoad = "_this call f_fnc_respawnTitle_onLoad;"

    class ControlsBackground
    {
        class WelcomeBack: CA2_DefaultText
        {
        	idc = 1000;
        	text = "Welcome back.";
            font = "PuristaBold";
        	x = 11 * GUI_GRID_W + GUI_GRID_X;
        	y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 18 * GUI_GRID_W;
        	h = 2.5 * GUI_GRID_H;
        	sizeEx = 3 * GUI_GRID_H;
        };

        class InfoText: CA2_DefaultStructuredText
        {
        	idc = IDC_RESPAWNTITLE_INFOTEXT;
        	text = "";
        	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 23 * GUI_GRID_W;
        	h = 4.5 * GUI_GRID_H;
        };

    };

};
