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
		class CAFE_GroupPicker_Background: CAFE_Background
		{
			idc = 1000;
		};

		class InfoGroup: CAFE_InfoTextControlGroup
		{
			class Controls 
			{
				// TODO: Fix this when it is changed by script
				class CurrentSquad: CAFE_InfoTextCenter
				{
					idc = IDC_GROUPPICKER_CURRENTSQUADTEXT;
					text = "You are in:";
				}
			}
		};

		class InfoBoxBorders: CAFE_InfoBoxBorderGroup {
			class Controls 
			{
				class topBorder: CAFE_InfoBoxTopBorder
				{
					colorBackground[] = {GROUP_PICKER_COLOR};
				};
				class leftBorder: CAFE_InfoBoxLeftBorder
				{
					colorBackground[] = {GROUP_PICKER_COLOR};
				};
				class bottomBorder: CAFE_InfoBoxBottomBorder
				{
					colorBackground[] = {GROUP_PICKER_COLOR};
				};
				class rightBorder: CAFE_InfoBoxRightBorder
				{
					colorBackground[] = {GROUP_PICKER_COLOR};
				};
			}
		};

		class VerticalBarrier: CAFE_VerticalBarrier
		{};

	};


	class Controls
    {
		class GroupInfoBoxes: CAFE_GroupInfoBoxesCtrlGroup
		{
			
		}

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
			idc = IDC_GROUPPICKER_CANCELBUTTON;
			text = "Cancel";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
            onButtonClick = "closeDialog 2";
		};

	};

};
