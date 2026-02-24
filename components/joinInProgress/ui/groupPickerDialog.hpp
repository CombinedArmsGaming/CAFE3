#include "../ui_macros.hpp"
#include "\a3\ui_f\hpp\definecommongrids.inc"

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
		{
			idc = IDC_GROUPPICKER_VERTICALBARRIER;
		};

		class InfoBoxBorders: CAFE_InfoBoxBorderGroup {
			class Controls 
			{
				class topBorder: CAFE_InfoBoxTopBorder
				{
					colorBackground[] = {LOADOUT_PICKER_COLOR};
				};
				class leftBorder: CAFE_InfoBoxLeftBorder
				{
					idc = IDC_GROUPPICKER_LEFTBORDER;
					colorBackground[] = {LOADOUT_PICKER_COLOR};
				};
				class bottomBorder: CAFE_InfoBoxBottomBorder
				{
					idc = IDC_GROUPPICKER_BOTTOMBORDER;
					colorBackground[] = {LOADOUT_PICKER_COLOR};
				};
				class rightBorder: CAFE_InfoBoxRightBorder
				{
					idc = IDC_GROUPPICKER_RIGHTBORDER;
					colorBackground[] = {LOADOUT_PICKER_COLOR};
				};
			}
		};

		

	};


	class Controls
    {
		class GroupInfoBoxes: CAFE_GroupInfoBoxesCtrlGroup
		{
			class Controls 
			{
				class GroupListbox: CAFE_GroupListbox
				{
				}
				class PlayersListbox: CAFE_PlayersListbox
				{
				}
			};
		}

		class CAFE_MapInfoBox: RscMapControl
        {
            idc = IDC_GROUPPICKER_MAP;
            x = (infoBoxOutlineTopLeftX) * GRID_W + GRID_X;
            y = (infoBoxOutlineTopLeftY + infoBoxOutlineWidth * 2 + groupInfoBoxHeight) * GRID_H + GRID_Y;
            w = (infoBoxOutlineBottomRightX - infoBoxOutlineTopLeftX) * GRID_W;
            h = (groupMapHeight) * GRID_H;
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

// Hardcode again to avoid messing with any other UIs that use this
#define GUI_GRID_X		(0)
#define GUI_GRID_Y		(0)
#define GUI_GRID_W		(0.025)
#define GUI_GRID_H		(0.04)
