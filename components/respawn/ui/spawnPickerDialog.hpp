#include "../ui_macros.hpp"

class CAFE_SpawnPicker_Dialog
{
	idd = IDD_SPAWNPICKER_DIALOG;
    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "_this call f_fnc_spawnPickerDialog_populateDialog;";
    onUnload = "_this call f_fnc_spawnPickerDialog_onCloseDialog;";

	class ControlsBackground
    {
		class Background: CAFE_DefaultText
		{
			idc = 1000;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 3 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 14 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};
		class MainTitle: CAFE_DefaultText
		{
			idc = 1001;
			text = "Choose a spawn location:";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			sizeEx = 1.2 * GUI_GRID_H;
		};
		class FeedbackText: CAFE_DefaultText
		{
			idc = 1002;
			text = "This is a temporary menu - message Bubbus with any feedback.";
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.5 * GUI_GRID_H;
		};

	};


	class Controls
    {
		class SpawnListbox: CAFE_DefaultListBox
		{
			idc = IDC_SPAWNPICKER_SPAWNLIST;
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 11 * GUI_GRID_H;
			sizeEx = 0.7 * GUI_GRID_H;
		};
		class ConfirmButton: CAFE_DefaultButton
		{
			idc = 1600;
			text = "CONFIRM SPAWN";
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
            onButtonClick = "closeDialog 1";
		};
		class CancelButton: CAFE_DefaultButton
		{
			idc = 1601;
			text = "Cancel";
			x = 23 * GUI_GRID_W + GUI_GRID_X;
			y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
            onButtonClick = "closeDialog 2";
		};

	};

};
