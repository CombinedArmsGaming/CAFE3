#include "../ui_macros.hpp"
import RscMapControl;
import RscMapControlEmpty;


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
		class Background: CAFE_DefaultText
		{
			idc = 1000;
			x = (CENTER_X - dialogWidth/2) * GRID_W + GRID_X;
			y = dialogY * GRID_H + GRID_Y;
			w = dialogWidth * GRID_W;
			// tooltipIcon stuff multiplied by 2 because once for tickets etc., and once for time you've been dead
			h = dialogHeight * GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};

		// class Test: CAFE_DefaultText
		// {
		// 	x = (CENTER_X - dialogWidth/2) * GRID_W + GRID_X;
		// 	y = 0;
		// 	w = deathTimerWidth * GRID_W;
		// 	h = 25 * GRID_H;
		// 	colorBackground[] = {0, 0, 1, 0.25};
		// }

		// Control group containing all of the informational text
		class InfoGroup: RscControlsGroup
		{
			idc = -1;
			// Positioned such that it spans from the left edge of the info box border to the right
			x = (infoBoxOutlineTopLeftX) * GRID_W + GRID_X;
			y = infoTextY * GRID_H + GRID_Y;
			w = infoTextWidth * GRID_W;
			h = (infoTextLineHeight * 2) * GRID_H;
			class Controls 
			{
				class TicketsText: CAFE_DefaultText
				{
					idc = IDC_TICKETS_TEXT;
					text = "Personal Tickets: 2\nSide Tickets: 30";
					style = ST_MULTI + ST_NO_RECT;
					x = 0;
					y = 0;
					w = ticketsInfoWidth * GRID_W;
					h = infoTextLineHeight * 2 * GRID_H;
					lineSpacing = 1;
					sizeEx = 0.7*GRID_H;
					// colorBackground[] = {0,1,0,0.25};
				}
				class DeathTimer: CAFE_DefaultText
				{
					idc = IDC_DEATH_TIMER;
					// text = "<t align='center' size='1.2'>You have been dead</t><br/><t size='0.8' align='center'>time u have been dead</t>";
					text = "Dead for:\n00:00"
					// sizeEx = 0.7
					style = ST_MULTI + ST_NO_RECT + ST_CENTER;
					x = (infoTextWidth/2 - deathTimerWidth/2) * GRID_W;
					y = 0;
					w = deathTimerWidth * GRID_W;
					h = infoTextLineHeight * 2 * GRID_H;
					sizeEx = 0.7*GRID_H;
					// colorBackground[] = {1,0,0,0.25};
				}
				class WaveInfo: CAFE_DefaultText
				{
					IDC= IDC_WAVE_TEXT;
					text = "Respawn Wave Status:\nUnavailable (wait 1m 20s)";
					style = ST_MULTI + ST_NO_RECT + ST_RIGHT;
					x = (infoTextWidth - waveInfoWidth) * GRID_W;
					y = 0;
					w = waveInfoWidth * GRID_W;
					h = infoTextLineHeight * 2 * GRID_H;
					sizeEx = 0.7*GRID_H;
					// colorBackground[] = {1,0,1,0.25};
				}
			}
		}
		
		class infoBoxTopBorder: CAFE_DefaultText
		{
			idc = IDC_INFO_BOX_OUTLINE;
			x = infoBoxOutlineTopLeftX * GRID_W + GRID_X;
			y = infoBoxOutlineTopLeftY * GRID_H + GRID_Y;
			w = (infoBoxOutlineBottomRightX - infoBoxOutlineTopLeftX) * GRID_W;
			h = (infoBoxOutlineWidth) * GRID_H;
			colorBackground[] = {PRIMARY_COLOR};
		}
		class infoBoxLeftBorder: CAFE_DefaultText
		{
			idc = IDC_INFO_BOX_OUTLINE + 1;
			x = infoBoxOutlineTopLeftX * GRID_W + GRID_X;
			y = infoBoxOutlineTopLeftY * GRID_H + GRID_Y;
			w = (infoBoxOutlineWidth) * GRID_W;
			h = (infoBoxOutlineBottomRightY - infoBoxOutlineTopLeftY) * GRID_H;
			colorBackground[] = {PRIMARY_COLOR};
		}
		class infoBoxBottomBorder: CAFE_DefaultText
		{
			idc = IDC_INFO_BOX_OUTLINE + 2;
			x = infoBoxOutlineTopLeftX * GRID_W + GRID_X;
			y = (infoBoxOutlineBottomRightY - infoBoxOutlineWidth) * GRID_H + GRID_Y;
			w = (infoBoxOutlineBottomRightX - infoBoxOutlineTopLeftX) * GRID_W;
			h = (infoBoxOutlineWidth) * GRID_H;
			colorBackground[] = {PRIMARY_COLOR};
		}
		class infoBoxRightBorder: CAFE_DefaultText
		{
			idc = IDC_INFO_BOX_OUTLINE + 3;
			x = (infoBoxOutlineBottomRightX - infoBoxOutlineWidth) * GRID_W + GRID_X;
			y = infoBoxOutlineTopLeftY * GRID_H + GRID_Y;
			w = (infoBoxOutlineWidth) * GRID_W;
			h = (infoBoxOutlineBottomRightY - infoBoxOutlineTopLeftY) * GRID_H;
			colorBackground[] = {PRIMARY_COLOR};
		}
		class verticalBarrier: CAFE_DefaultText
		{
			idc = -1;
			x = (CENTER_X - verticalBarrierWidth/2) * GRID_W + GRID_X;
			y = (infoBoxY) * GRID_H + GRID_Y;
			w = verticalBarrierWidth * GRID_W;
			h = infoBoxHeight * GRID_H;
			colorBackground[] = {0.42, 0.42, 0.42, 1};
		}
	};


	class Controls
    {	
		class GroupInfoBoxes: RscControlsGroup
		{
			idc = IDC_GROUP_CT_GROUP;
			x = (CENTER_X - verticalBarrierWidth/2 - infoBoxWidth) * GRID_W + GRID_X;
			y = infoBoxY * GRID_H + GRID_Y;
			w = (infoBoxWidth * 2 + verticalBarrierWidth) * GRID_W;
			h = (infoBoxHeight) * GRID_H;
			onLoad = "(_this # 0) ctrlShow false";
			class Controls 
			{
				class GroupListbox: CAFE_DefaultListBox
				{
					idc = IDC_GROUPSLIST;
					x = 0;
					y = 0;
					w = infoBoxWidth * GRID_W;
					h = infoBoxHeight * GRID_H;
					onLBSelChanged = "_this call f_fnc_spawnPickerDialog_groupsList_onLBSelChanged;";
				}
				class PlayersListbox: CAFE_DefaultListBox
				{
					idc = IDC_PLAYERSLIST;
					x = (infoBoxWidth + verticalBarrierWidth) * GRID_W;
					y = 0;
					w = infoBoxWidth * GRID_W;
					h = infoBoxHeight * GRID_H;
					colorDisabled[] = {1,1,1,1};
					// Allows scrolling but doesn't allow selecting
					onLBSelChanged = "_this call f_fnc_spawnPickerDialog_deselectWithoutScrolling";
				}
			};
		}

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
					onLBSelChanged = "_this call f_fnc_spawnPickerDialog_deselectWithoutScrolling"
				}
			};
		}

		// These info boxes can't be in a controls group because CT_MAP_MAIN controls don't allow it
		class SpawnListbox: CAFE_DefaultListBox
		{
			idc = IDC_SPAWNPICKER_SPAWNLIST;
			x = (CENTER_X - verticalBarrierWidth/2 - infoBoxWidth) * GRID_W + GRID_X;
			y = infoBoxY * GRID_H + GRID_Y;
			w = infoBoxWidth * GRID_W;
			h = infoBoxHeight * GRID_H;
			sizeEx = 1 * GRID_H; // was 0.7
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
		class LoadoutButton: InfoBoxSelectorButton
		{
			idc = IDC_LOADOUT_BUTTON;
			x = (infoBoxOutlineTopLeftX + infoBoxSelectorButtonW * 2) * GRID_W + GRID_X;
			text = "Loadout";
			colorBackground[] = {0, 0, 0,1};
			colorBackgroundActive[] = {LOADOUT_PICKER_COLOR};
			onButtonClick = "['loadout'] call f_fnc_spawnPickerDialog_switchInfoBox";
		}

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
					x = 0
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
					onLoad = "(_this # 0) ctrlSetChecked (missionNamespace getVariable ['f_var_playerWishesTeleportAfterRespawn', false])"
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
		}
		
		// Buttons to switch info box
		
		// class ConfirmButton: CAFE_DefaultButton
		// {
		// 	idc = 1600;
		// 	text = "CONFIRM SPAWN";
		// 	x = 20 * GUI_GRID_W + GUI_GRID_X;
		// 	y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
		// 	w = 9.5 * GUI_GRID_W;
		// 	h = 2 * GUI_GRID_H;
        //     onButtonClick = "closeDialog 1";
		// };
		// class CancelButton: CAFE_DefaultButton
		// {
		// 	idc = 1601;
		// 	text = "Cancel";
		// 	x = 30 * GUI_GRID_W + GUI_GRID_X;
		// 	y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
		// 	w = 4 * GUI_GRID_W;
		// 	h = 2 * GUI_GRID_H;
        //     onButtonClick = "closeDialog 2";
		// };
	};

};

// Hardcode again to avoid messing with any other UIs that use this
#define GUI_GRID_X		(0)
#define GUI_GRID_Y		(0)
#define GUI_GRID_W		(0.025)
#define GUI_GRID_H		(0.04)