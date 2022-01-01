#include "../ui_macros.hpp"

class CAFE_GroupPicker_Dialog
{
	idd = IDD_GROUPPICKER_DIALOG;
    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "_this call f_fnc_groupPickerDialog_populateDialog;";
    onUnload = "_this call f_fnc_groupPickerDialog_onCloseDialog;";

	class ControlsBackground
    {
		class CAFE_GroupPicker_Background: CAFE_DefaultText
		{
			idc = 1000;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 14.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};

		class CAFE_GroupPicker_ButtonsBackground: CAFE_DefaultText
		{
			idc = 1007;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};

		class CAFE_GroupPicker_Feedback: CAFE_DefaultText
		{
			idc = 1008;
			text = "Experimental squad menu.  Feedback?  Tell Bubbus.";
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 0.7 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.5 * GUI_GRID_H;
		};

	};


	class Controls
    {
		class CAFE_GroupPicker_Title: CAFE_DefaultText
		{
			idc = 1001;
			text = "Squad selection menu.";
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 1.3 * GUI_GRID_H;
		};

		class CAFE_GroupPicker_CurrentSquadTitle: CAFE_DefaultText
		{
			idc = 1002;
			text = "You are in:";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 5.6 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			sizeEx = 0.7 * GUI_GRID_H;
		};

		class CAFE_GroupPicker_CurrentSquadText: CAFE_DefaultText
		{
			idc = IDC_GROUPPICKER_CURRENTSQUADTEXT;
			text = "%1";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 5.6 * GUI_GRID_H + GUI_GRID_Y;
			w = 9 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			sizeEx = 0.7 * GUI_GRID_H;
		};

		class CAFE_GroupPicker_SquadListTitle: CAFE_DefaultText
		{
			idc = 1004;
			text = "Available squads:";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

		class CAFE_GroupPicker_SquadListSubtitle: CAFE_DefaultText
		{
			idc = 1005;
			text = "(Sorted by number of members.  AI squads not included.)";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			sizeEx = 0.6 * GUI_GRID_H;
		};

		class CAFE_GroupPicker_SquadList: CAFE_DefaultListBox
		{
			idc = IDC_GROUPPICKER_SQUADLIST;
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 9 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 6 * GUI_GRID_H;
			sizeEx = 0.7 * GUI_GRID_H;
		};

		class CAFE_GroupPicker_TeleportTitle: CAFE_DefaultText
		{
			idc = 1006;
			text = "Teleport to squad:";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

		class CAFE_GroupPicker_TeleportCheckbox: CAFE_DefaultTextCheckBox
		{
			idc = IDC_GROUPPICKER_TELEPORTCHECKBOX;
			text = "Yes";
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			strings[] = {"No"};
			checked_strings[] = {"Yes"};
			style = 2;
		};

		class CAFE_GroupPicker_ConfirmButton: CAFE_DefaultButton
		{
			idc = 1600;
			text = "Confirm";
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
            onButtonClick = "closeDialog 1";
		};

		class CAFE_GroupPicker_CancelButton: CAFE_DefaultButton
		{
			idc = 1601;
			text = "Cancel";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
            onButtonClick = "closeDialog 2";
		};

	};

};
