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

		class VerticalBarrier: CAFE_VerticalBarrier
		{};

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

		

	};


	class Controls
    {
		class GroupInfoBoxes: CAFE_GroupInfoBoxesCtrlGroup
		{

		}

		class TeleportGroup: CAFE_TeleportToSquadCtrlGroup
		{}
		
		class ReadyButton: CAFE_ReadyButton
		{}

		class CancelButton:CAFE_CancelButton
		{
			idc = IDC_GROUPPICKER_CANCELBUTTON;
		};

	};

};
