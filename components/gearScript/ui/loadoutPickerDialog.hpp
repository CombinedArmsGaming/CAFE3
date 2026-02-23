#include "\a3\ui_f\hpp\definecommongrids.inc"
#include "../ui_macros.hpp"
#include "../macros.hpp"

class CAFE_LoadoutPicker_Dialog
{
	idd = IDD_LOADOUTPICKER_DIALOG;
    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "_this call f_fnc_loadoutPickerDialog_populateDialog;";
    onUnload = "_this call f_fnc_loadoutPickerDialog_onCloseDialog;";

	class ControlsBackground
    {
		class Background: CAFE_Background
		{
			idc = 1000;
		};

		// Control group containing all of the informational text
		class InfoGroup: CAFE_InfoTextControlGroup
		{
			class Controls 
			{
				class DeathTimer: CAFE_InfoTextCenter
				{
					idc = IDC_CURRENTLOADOUT_TEXT;
					text = "Your current loadout is:";
				}
			}
		}

		class InfoBoxBorders: CAFE_InfoBoxBorderGroup {
			class Controls 
			{
				class topBorder: CAFE_InfoBoxTopBorder
				{
					colorBackground[] = {LOADOUT_PICKER_COLOR};
				};
				class leftBorder: CAFE_InfoBoxLeftBorder
				{
					colorBackground[] = {LOADOUT_PICKER_COLOR};
				};
				class bottomBorder: CAFE_InfoBoxBottomBorder
				{
					colorBackground[] = {LOADOUT_PICKER_COLOR};
				};
				class rightBorder: CAFE_InfoBoxRightBorder
				{
					colorBackground[] = {LOADOUT_PICKER_COLOR};
				};
			}
		}

		class VerticalBarrier: CAFE_VerticalBarrier
		{}
		
	};


	class Controls
    {	
		class LoadoutInfoBoxes: CAFE_LoadoutInfoBoxesCtrlGroup
		{}
		
		// Ready button
		class ReadyButton: CAFE_ReadyButton
		{
            text = "CONFIRM";
		}

		class CancelButton: CAFE_CancelButton
		{
		}
	};

};

// Hardcode again to avoid messing with any other UIs that use this
#define GUI_GRID_X		(0)
#define GUI_GRID_Y		(0)
#define GUI_GRID_W		(0.025)
#define GUI_GRID_H		(0.04)
