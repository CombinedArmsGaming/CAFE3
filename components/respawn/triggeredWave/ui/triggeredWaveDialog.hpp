#include "../ui_macros.hpp"

class CAFE_TriggerRespawnWave_Dialog
{
	idd = IDD_SQUADMARKER_DIALOG;
    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "_this call f_fnc_triggeredWaveDialog_populateDialog;";

	class ControlsBackground
    {
		class RscText_1000: CAFE_DefaultText
		{
			idc = 1000;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 14.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};

		class RscText_1006: CAFE_DefaultText
		{
			idc = 1006;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};

		class RscText_1007: CAFE_DefaultText
		{
			idc = 1007;
			text = "Experimental respawn wave dialog.  Any feedback?  Tell Bubbus.";
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.6 * GUI_GRID_H;
		};

	};


	class Controls
    {
		class CAFE_TriggeredWave_Title: CAFE_DefaultText
		{
			idc = 1001;
			text = "Respawn Menu.";
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			sizeEx = 1.3 * GUI_GRID_H;
		};

		class CAFE_TriggeredWave_TicketsLeftTitle: CAFE_DefaultText
		{
			idc = 1002;
			text = "Tickets left:";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			sizeEx = 0.7 * GUI_GRID_H;
		};

		class CAFE_TriggeredWave_TicketsLeftText: CAFE_DefaultText
		{
			idc = IDC_TRIGGEREDWAVE_DIALOG_TICKETSLEFT;
			text = "";
			x = 17.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			sizeEx = 0.7 * GUI_GRID_H;
		};

		class RscText_1005: CAFE_DefaultText
		{
			idc = IDC_TRIGGEREDWAVE_DIALOG_PLAYERSTITLE;
			text = "Waiting players:";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			sizeEx = 0.8 * GUI_GRID_H;
		};

		class CAFE_TriggeredWave_PlayerList: CAFE_DefaultListBox
		{
			idc = IDC_TRIGGEREDWAVE_DIALOG_PLAYERLIST;
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 9 * GUI_GRID_H;
		};

		class CAFE_TriggeredWave_RespawnButton: CAFE_DefaultButton
		{
			idc = IDC_TRIGGEREDWAVE_DIALOG_RESPAWNBUTTON;
			text = "Respawn Players";
			x = 17.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
            onButtonClick = "[playerSide] call f_fnc_tryTriggerRespawnWave";
		};

		class CAFE_TriggeredWave_CloseButton: CAFE_DefaultButton
		{
			idc = 1601;
			text = "Close";
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
            onButtonClick = "closeDialog 1";
		};

	};

};
