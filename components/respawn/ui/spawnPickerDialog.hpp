#include "\a3\ui_f\hpp\definecommongrids.inc"
#include "../ui_macros.hpp"
import RscMapControl;
import RscMapControlEmpty;

// Design for spawnPickerDialog UI

#define dialogY 0
#define dialogWidth 32

#define infoTextVerticalPadding 0.6 // Padding above the info text group
#define infoTextLineHeight 0.7 // Height of one line of the info text box
#define ticketsInfoWidth 7
#define timerInfoWidth 6
#define waveInfoWidth 8.5

#define deathTimerWidth 9

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

#define cancelButtonWidth 4
#define cancelButtonHeight 1.5

#define GUI_GRID_WIDTH 40
#define GUI_GRID_HEIGHT 25
#define CENTER_X GUI_GRID_WIDTH/2
#define CENTER_Y GUI_GRID_HEIGHT/2

#define GRID_X GUI_GRID_CENTER_X // Left edge of GUI_GRID_CENTER
#define GRID_Y GUI_GRID_CENTER_Y // Top edge of GUI_GRID_CENTER
#define GRID_W GUI_GRID_CENTER_W // Width of one grid cell
#define GRID_H GUI_GRID_CENTER_H // Height of one grid cell

// Derived parameters
#define infoTextY (dialogY + infoTextVerticalPadding)

#define infoBoxOutlineTopLeftX (CENTER_X - verticalBarrierWidth / 2 - infoBoxWidth - infoBoxOutlineWidth) // X coord of the top left outside edge of the outline around the info boxes 
#define infoBoxOutlineTopLeftY (infoTextY + infoTextLineHeight * 2) // Y coord of ^
#define infoBoxOutlineBottomRightX (CENTER_X + verticalBarrierWidth / 2 + infoBoxWidth + infoBoxOutlineWidth) // X coord of the bottom right outside edge of the outline around the info boxes
#define infoBoxOutlineBottomRightY (infoBoxOutlineTopLeftY + infoBoxOutlineWidth * 2 + infoBoxHeight)

#define infoTextWidth (infoBoxOutlineBottomRightX - infoBoxOutlineTopLeftX)

#define infoBoxY (infoBoxOutlineTopLeftY + infoBoxOutlineWidth)

#define infoBoxSelectorButtonY (infoBoxOutlineBottomRightY)

#ifdef ALLOW_LOADOUT_CHANGE_UPON_RESPAWN
#define infoBoxSelectorButtonW ((infoBoxOutlineBottomRightX - infoBoxOutlineTopLeftX) / 3)
#else 
#define infoBoxSelectorButtonW ((infoBoxOutlineBottomRightX - infoBoxOutlineTopLeftX) / 2)
#endif

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
				}
				class DeathTimer: CAFE_DefaultText
				{
					idc = IDC_DEATH_TIMER;
					text = "Dead for:\n00:00"
					style = ST_MULTI + ST_NO_RECT + ST_CENTER;
					x = (infoTextWidth/2 - deathTimerWidth/2) * GRID_W;
					y = 0;
					w = deathTimerWidth * GRID_W;
					h = infoTextLineHeight * 2 * GRID_H;
					sizeEx = 0.7*GRID_H;
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
					onLBSelChanged = "_this call f_fnc_spawnPickerDialog_deselectWithoutScrolling"
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