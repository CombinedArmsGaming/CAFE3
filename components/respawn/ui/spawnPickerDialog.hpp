#include "\a3\ui_f\hpp\definecommongrids.inc"
#include "../ui_macros.hpp"
import RscMapControl;
import RscMapControlEmpty;
import RscFrame;

// Design for spawnPickerDialog UI

class InfoBoxSelectorButton : CAFE_DefaultButton {
	y = (infoBoxSelectorButtonY) * GRID_H + GRID_Y;
	w = (infoBoxSelectorButtonW) * GRID_W;
	h = (infoBoxSelectorButtonH) * GRID_H;
}

class CAFE_SpawnPicker_Dialog
{
	idd = IDD_SPAWNPICKER_DIALOG;
    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "_this call f_fnc_spawnPickerDialog_populateDialog;";
    onUnload = "_this call f_fnc_spawnPickerDialog_onCloseDialog;";

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
				class TicketsText: CAFE_InfoTextLeft
				{
					idc = IDC_TICKETS_TEXT;
					text = "Personal Tickets: 2\nSide Tickets: 30";
				}
				class DeathTimer: CAFE_InfoTextCenter
				{
					idc = IDC_DEATH_TIMER;
					text = "Dead for:\n00:00";
				}
				class WaveInfo: CAFE_InfoTextRight
				{
					IDC= IDC_WAVE_TEXT;
					text = "Respawn Wave Status:\nUnavailable (wait 1m 20s)";
				}
			}
		}

		class InfoBoxBorders: CAFE_InfoBoxBorderGroup {
			class Controls 
			{
				class topBorder: CAFE_InfoBoxTopBorder
				{
					colorBackground[] = {LOCATION_PICKER_COLOR};
				};
				class leftBorder: CAFE_InfoBoxLeftBorder
				{
					colorBackground[] = {LOCATION_PICKER_COLOR};
				};
				class bottomBorder: CAFE_InfoBoxBottomBorder
				{
					colorBackground[] = {LOCATION_PICKER_COLOR};
				};
				class rightBorder: CAFE_InfoBoxRightBorder
				{
					colorBackground[] = {LOCATION_PICKER_COLOR};
				};
			}
		}

		class VerticalBarrier: CAFE_VerticalBarrier
		{}
		
	};


	class Controls
    {	
		class GroupInfoBoxes: CAFE_GroupInfoBoxesCtrlGroup
		{
			onLoad = "(_this # 0) ctrlShow false";
		};

		#ifdef ALLOW_LOADOUT_CHANGE_UPON_RESPAWN
		class LoadoutInfoBoxes: CAFE_LoadoutInfoBoxesCtrlGroup
		{
			
		}
		#endif

		// These info boxes can't be in a controls group because CT_MAP_MAIN controls don't allow it
		class SpawnListbox: CAFE_SpawnpointListbox
		{
			onLBSelChanged = "_this call f_fnc_spawnPickerDialog_spawnList_onLBSelChanged;";
		}
		class MapScreen: CAFE_MapInfoBox
		{
		}

		// Info box selector buttons
		class LocationButton: InfoBoxSelectorButton
		{
			idc = IDC_LOCATION_BUTTON;
			x = (infoBoxOutlineTopLeftX) * GRID_W + GRID_X;
			text = "Location";
			colorBackground[] = {LOCATION_PICKER_COLOR};
			colorBackgroundActive[] = {LOCATION_PICKER_COLOR};
			onButtonClick = "['location', ctrlParent (_this # 0)] call f_fnc_spawnPickerDialog_switchInfoBox";
		}
		class GroupButton: InfoBoxSelectorButton
		{
			idc = IDC_GROUP_BUTTON;
			x = (infoBoxOutlineTopLeftX + infoBoxSelectorButtonW) * GRID_W + GRID_X;
			text = "Group";
			colorBackground[] = {0, 0, 0,1};
			colorBackgroundActive[] = {GROUP_PICKER_COLOR};
			onButtonClick = "['group', ctrlParent (_this # 0)] call f_fnc_spawnPickerDialog_switchInfoBox";
		}
		#ifdef ALLOW_LOADOUT_CHANGE_UPON_RESPAWN
		class LoadoutButton: InfoBoxSelectorButton
		{
			idc = IDC_LOADOUT_BUTTON;
			x = (infoBoxOutlineTopLeftX + infoBoxSelectorButtonW * 2) * GRID_W + GRID_X;
			text = "Loadout";
			colorBackground[] = {0, 0, 0,1};
			colorBackgroundActive[] = {LOADOUT_PICKER_COLOR};
			onButtonClick = "['loadout', ctrlParent (_this # 0)] call f_fnc_spawnPickerDialog_switchInfoBox";
		}
		#endif

		class TeleportGroup: CAFE_TeleportToSquadCtrlGroup 
		{
		}
		
		
		// Ready button
		class ReadyButton: CAFE_ReadyButton
		{
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