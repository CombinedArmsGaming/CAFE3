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
				class TicketsText: CAFE_InfoText
				{
					idc = IDC_TICKETS_TEXT;
					text = "Personal Tickets: 2\nSide Tickets: 30";
					style = ST_MULTI + ST_NO_RECT;
					x = 0;
					w = ticketsInfoWidth * GRID_W;
				}
				class DeathTimer: CAFE_InfoText
				{
					idc = IDC_DEATH_TIMER;
					text = "Dead for:\n00:00";
					style = ST_MULTI + ST_NO_RECT + ST_CENTER;
					x = (infoTextWidth/2 - deathTimerWidth/2) * GRID_W;
					w = deathTimerWidth * GRID_W;
				}
				class WaveInfo: CAFE_InfoText
				{
					IDC= IDC_WAVE_TEXT;
					text = "Respawn Wave Status:\nUnavailable (wait 1m 20s)";
					style = ST_MULTI + ST_NO_RECT + ST_RIGHT;
					x = (infoTextWidth - waveInfoWidth) * GRID_W;
					w = waveInfoWidth * GRID_W;
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

		}

		#ifdef ALLOW_LOADOUT_CHANGE_UPON_RESPAWN
		class LoadoutInfoBoxes: RscControlsGroup
		{
			idc = IDC_LOADOUT_CT_GROUP;
			x = (CENTER_X - verticalBarrierWidth/2 - infoBoxWidth) * GRID_W + GRID_X;
			y = infoBoxY * GRID_H + GRID_Y;
			w = (infoBoxWidth * 2 + verticalBarrierWidth) * GRID_W;
			h = (infoBoxHeight) * GRID_H;
			onLoad = "(_this # 0) ctrlShow false";
			class Controls 
			{
				class LoadoutsListbox: CAFE_DefaultListBox
				{
					idc = IDC_LOADOUTSLIST;
					x = 0;
					y = 0;
					w = infoBoxWidth * GRID_W;
					h = infoBoxHeight * GRID_H;
					onLBSelChanged = "_this call f_fnc_spawnPickerDialog_loadoutsList_onLBSelChanged;";
					onLoad = "_this call f_fnc_spawnPickerDialog_populateLoadoutsList"
				}
				class GearListbox: CAFE_DefaultListBox
				{
					idc = IDC_GEARLIST;
					x = (infoBoxWidth + verticalBarrierWidth) * GRID_W;
					y = 0;
					w = infoBoxWidth * GRID_W;
					h = infoBoxHeight * GRID_H;
					colorDisabled[] = {1,1,1,1};
					// Allows scrolling but doesn't allow selecting
					onLBSelChanged = "_this call f_fnc_listBoxDeselectWithoutScrolling"
				}
			};
		}
		#endif

		// These info boxes can't be in a controls group because CT_MAP_MAIN controls don't allow it
		class SpawnListbox: CAFE_DefaultListBox
		{
			idc = IDC_SPAWNPICKER_SPAWNLIST;
			x = (CENTER_X - verticalBarrierWidth/2 - infoBoxWidth) * GRID_W + GRID_X;
			y = infoBoxY * GRID_H + GRID_Y;
			w = infoBoxWidth * GRID_W;
			h = infoBoxHeight * GRID_H;
			sizeEx = 1 * GRID_H;
			onLBSelChanged = "_this call f_fnc_spawnPickerDialog_spawnList_onLBSelChanged;";
		}
		class MapScreen: RscMapControl
		{
			idc = IDC_RESPAWN_MAP;
			x = (CENTER_X + verticalBarrierWidth/2) * GRID_W + GRID_X;
			y = infoBoxY * GRID_H + GRID_Y;
			w = infoBoxWidth * GRID_W;
			h = infoBoxHeight * GRID_H;
		}

		// Info box selector buttons
		class LocationButton: InfoBoxSelectorButton
		{
			idc = IDC_LOCATION_BUTTON;
			x = (infoBoxOutlineTopLeftX) * GRID_W + GRID_X;
			text = "Location";
			colorBackground[] = {LOCATION_PICKER_COLOR};
			colorBackgroundActive[] = {LOCATION_PICKER_COLOR};
			onButtonClick = "['location'] call f_fnc_spawnPickerDialog_switchInfoBox";
		}
		class GroupButton: InfoBoxSelectorButton
		{
			idc = IDC_GROUP_BUTTON;
			x = (infoBoxOutlineTopLeftX + infoBoxSelectorButtonW) * GRID_W + GRID_X;
			text = "Group";
			colorBackground[] = {0, 0, 0,1};
			colorBackgroundActive[] = {GROUP_PICKER_COLOR};
			onButtonClick = "['group'] call f_fnc_spawnPickerDialog_switchInfoBox";
		}
		#ifdef ALLOW_LOADOUT_CHANGE_UPON_RESPAWN
		class LoadoutButton: InfoBoxSelectorButton
		{
			idc = IDC_LOADOUT_BUTTON;
			x = (infoBoxOutlineTopLeftX + infoBoxSelectorButtonW * 2) * GRID_W + GRID_X;
			text = "Loadout";
			colorBackground[] = {0, 0, 0,1};
			colorBackgroundActive[] = {LOADOUT_PICKER_COLOR};
			onButtonClick = "['loadout'] call f_fnc_spawnPickerDialog_switchInfoBox";
		}
		#endif

		class TeleportGroup: RscControlsGroup 
		{
			idc = -1;
			x = (CENTER_X - teleportGroupWidth/2) * GRID_W + GRID_X;
			y = teleportGroupY * GRID_H + GRID_Y;
			w = teleportGroupWidth * GRID_W;
			h = teleportGroupHeight * GRID_H;
			class Controls 
			{
				class TeleportTitle: CAFE_DefaultText
				{
					idc = -1;
					text = "Teleport to squad:";
					x = 0;
					y = 0;
					w = teleportTitleWidth * GRID_W;
					h = teleportGroupHeight * GRID_H;
				};
				class TeleportCheckbox: CAFE_DefaultTextCheckBox
				{
					idc = IDC_TELEPORTCHECKBOX;
					x = teleportTitleWidth * GRID_W;
					y = 0;
					w = teleportCheckboxWidth * GRID_W;
					h = teleportGroupHeight * GRID_H;
					strings[] = {"No"};
					checked_strings[] = {"Yes"};
					style = 2;
					onLoad = "(_this # 0) ctrlSetChecked (missionNamespace getVariable ['f_var_playerWishesTeleportAfterRespawn', false])";
				};
			}
		}
		
		
		// Ready button
		class ReadyButton: CAFE_DefaultButton
		{
			idc = IDC_READY_BUTTON;
			x = (CENTER_X - readyButtonWidth/2) * GRID_W + GRID_X;
			y = readyButtonY * GRID_H + GRID_Y;
			w = readyButtonWidth * GRID_W;
			h = readyButtonHeight * GRID_H;
			text = "READY";
			onButtonClick = "closeDialog 1";
			colorBackground[] = {LOCATION_PICKER_COLOR};
			colorBackgroundActive[] = {0, 0, 0, 1};
		}

		class CancelButton: CAFE_DefaultButton
		{
			idc = IDC_CANCEL_BUTTON;
			x = infoBoxOutlineTopLeftX * GRID_W + GRID_X;
			y = (readyButtonY + ((readyButtonHeight - cancelButtonHeight) / 2)) * GRID_H + GRID_Y;
			w = cancelButtonWidth * GRID_W;
			h = cancelButtonHeight * GRID_H;
			text = "CANCEL";
			onButtonClick = "closeDialog 3";
			colorBackground[] = {0, 0, 0, 0.25};
			colorBackgroundActive[] = {0, 0, 0, 1};
		}
	};

};

// Hardcode again to avoid messing with any other UIs that use this
#define GUI_GRID_X		(0)
#define GUI_GRID_Y		(0)
#define GUI_GRID_W		(0.025)
#define GUI_GRID_H		(0.04)