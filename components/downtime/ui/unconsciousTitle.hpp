#include "../ui_macros.hpp"

class CA2_DowntimeUnconscious
{
    idd = -1;

	movingEnable = false;
	enableSimulation = true;

    fadein = 1;
    duration = 4;
	fadeout = 2;


    class ControlsBackground
    {
        class YouAre: CA2_DefaultText
        {
        	idc = 1000;
            style = ST_CENTER;
        	text = "You are";
            font = "PuristaBold";
        	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 7 * GUI_GRID_H + GUI_GRID_Y;
        	w = 25 * GUI_GRID_W;
        	h = 3 * GUI_GRID_H;
        	sizeEx = 2 * GUI_GRID_H;
        };

        class Unconscious: CA2_DefaultText
        {
        	idc = 1001;
            style = ST_CENTER;
        	text = "Unconscious";
            font = "PuristaBold";
        	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 9 * GUI_GRID_H + GUI_GRID_Y;
        	w = 25 * GUI_GRID_W;
        	h = 3 * GUI_GRID_H;
        	sizeEx = 3 * GUI_GRID_H;
        };

        class Welcome: CA2_DefaultText
        {
        	idc = 1002;
            style = ST_CENTER;
        	text = "Spectate while you wait.";
        	x = 7.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 12 * GUI_GRID_H + GUI_GRID_Y;
        	w = 25 * GUI_GRID_W;
        	h = 3 * GUI_GRID_H;
        	sizeEx = 1.2 * GUI_GRID_H;
        };

    };

};
