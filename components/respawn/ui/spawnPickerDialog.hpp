#include "../ui_macros.hpp"
#include "\a3\ui_f\hpp\definecommongrids.inc"
import RscMapControl;
import RscMapControlEmpty;

// Designing for RESPAWN_MODE_TIMED_TICKETS

#define dialogY 1
#define dialogWidth 35


#define tooltipIconHorizontalPadding 0.1 // Padding between the tooltip icon text boxes
#define tooltipIconVerticalPadding 0.6 // Padding above and below the tooltip icon
#define tooltipIconHeight 1
#define ticketsTooltipWidth 4

#define deathTimerWidth 10
#define deathTimerHeight tooltipIconHeight
#define deathTimerVerticalPadding tooltipIconVerticalPadding // Amount of padding below the death timer

#define infoBoxWidth 14 // Width of one of the little info boxes that have stuff like spawn list, map, loadout list, etc.
#define infoBoxHeight 14
#define verticalBarrierWidth 0.2 // Width of the vertical barrier separating list you pick from and info on the other side
#define infoBoxSelectorHeight 1 // Height of the three options you swap between to choose which infoBox you want
#define infoBoxOutlineWidth 0.2 // Width of the outline that goes around the info boxes

#define teleportGroupVerticalPadding 0.5 // Padding above the checkbox
#define teleportGroupHeight 1
#define teleportCheckboxWidth 4.5
#define teleportTitleWidth 6.5
#define teleportGroupWidth (teleportCheckboxWidth + teleportTitleWidth)

#define readyButtonVerticalPadding 0.5
#define readyButtonWidth 9.5
#define readyButtonHeight 2

#define GUI_GRID_WIDTH 40
#define GUI_GRID_HEIGHT 25
#define CENTER_X GUI_GRID_WIDTH/2
#define CENTER_Y GUI_GRID_HEIGHT/2

#define GRID_X GUI_GRID_CENTER_X // Left edge of GUI_GRID_CENTER
#define GRID_Y GUI_GRID_CENTER_Y // Top edge of GUI_GRID_CENTER
#define GRID_W GUI_GRID_CENTER_W // Width of one grid cell
#define GRID_H GUI_GRID_CENTER_H // Height of one grid cell

// Derived parameters
#define tooltipIconY (dialogY + tooltipIconVerticalPadding)

#define deathTimerY (tooltipIconY + tooltipIconHeight + tooltipIconVerticalPadding)

#define infoBoxOutlineTopLeftX (CENTER_X - verticalBarrierWidth / 2 - infoBoxWidth - infoBoxOutlineWidth) // X coord of the top left outside edge of the outline around the info boxes 
#define infoBoxOutlineTopLeftY (deathTimerY + deathTimerHeight + deathTimerVerticalPadding) // Y coord of ^
#define infoBoxOutlineBottomRightX (CENTER_X + verticalBarrierWidth / 2 + infoBoxWidth + infoBoxOutlineWidth) // X coord of the bottom right outside edge of the outline around the info boxes
#define infoBoxOutlineBottomRightY (infoBoxOutlineTopLeftY + infoBoxOutlineWidth * 2 + infoBoxHeight)

#define infoBoxY (infoBoxOutlineTopLeftY + infoBoxOutlineWidth)

#define infoBoxSelectorButtonY (infoBoxOutlineBottomRightY)
#define infoBoxSelectorButtonW ((infoBoxOutlineBottomRightX - infoBoxOutlineTopLeftX) / 3)
#define infoBoxSelectorButtonH 3

#define teleportGroupY (infoBoxOutlineBottomRightY + infoBoxSelectorButtonH + teleportGroupVerticalPadding)

#define readyButtonY (teleportGroupY + teleportGroupHeight + readyButtonVerticalPadding)

#define dialogHeight (readyButtonY + readyButtonVerticalPadding + readyButtonHeight - dialogY)

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
		// class MainTitle: CAFE_DefaultText
		// {
		// 	idc = 1001;
		// 	text = "Choose a spawn location:";
		// 	x = 21 * GUI_GRID_W + GUI_GRID_X;
		// 	y = 3.5 * GUI_GRID_H + GUI_GRID_Y;
		// 	w = 12 * GUI_GRID_W;
		// 	h = 1 * GUI_GRID_H;
		// 	sizeEx = 1.2 * GUI_GRID_H;
		// };
		// class FeedbackText: CAFE_DefaultText
		// {
		// 	idc = 1002;
		// 	text = "This is a temporary menu - message Bubbus with any feedback.";
		// 	x = 20 * GUI_GRID_W + GUI_GRID_X;
		// 	y = 20 * GUI_GRID_H + GUI_GRID_Y;
		// 	w = 14 * GUI_GRID_W;
		// 	h = 0.5 * GUI_GRID_H;
		// 	colorBackground[] = {0,0,0,0.5};
		// 	sizeEx = 0.5 * GUI_GRID_H;
		// };
		class TicketsIcon: CAFE_DefaultStructuredText
		{
			idc = IDC_TICKETS_TEXT;
			text = "<t align='center'>Tickets</t>";
			x = (CENTER_X - ticketsTooltipWidth/2) * GRID_W + GRID_X;
			y = (tooltipIconY) * GRID_H + GRID_Y;
			w = ticketsTooltipWidth * GRID_W;
			h = tooltipIconHeight * GRID_H;
			colorBackground[] = {0,0,0,0};
			tooltip = "Tickets loading"
		}
		class DeathTimer: CAFE_DefaultStructuredText
		{
			idc = IDC_DEATH_TIMER;
			text = "<t align='center'>time u have been dead</t>";
			x = (CENTER_X - deathTimerWidth/2) * GRID_W + GRID_X;
			y = (deathTimerY) * GRID_H + GRID_Y;
			w = deathTimerWidth * GRID_W;
			h = deathTimerHeight * GRID_H;
			colorBackground[] = {0,0,0,0};
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
					onLoad = "(_this # 0) ctrlEnable false";
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