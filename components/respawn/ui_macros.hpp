#include "\a3\ui_f\hpp\definecommongrids.inc"

#define IDD_SPAWNPICKER_DIALOG 12154

// Location info boxes
#define IDC_SPAWNPICKER_SPAWNLIST 1500
#define IDC_RESPAWN_MAP 1501

// Group info boxes
#define IDC_GROUPSLIST 1502
#define IDC_PLAYERSLIST 1503

// Loadout info boxes
#define IDC_LOADOUTSLIST 1504
#define IDC_GEARLIST 1505

// Control groups
#define IDC_GROUP_CT_GROUP 2001
#define IDC_LOADOUT_CT_GROUP 2002

#define IDC_TICKETS_TEXT 1003

#define IDC_DEATH_TIMER 1004

#define IDC_WAVE_TEXT 1005

// Info box selector buttons
#define IDC_LOCATION_BUTTON 1006
#define IDC_GROUP_BUTTON 1007
#define IDC_LOADOUT_BUTTON 1008

#define IDC_READY_BUTTON 1009

#define IDC_TELEPORTCHECKBOX 1010

#define IDC_INFO_BOX_OUTLINE 6900


// Colors defined without brackets because .hpp uses {} and .sqf uses []
// Color shared between major elements
#define PRIMARY_COLOR 0.65, 0.39, 0.05, 1

#define LOCATION_PICKER_COLOR PRIMARY_COLOR

#define GROUP_PICKER_COLOR 0.74, 0.93, 0.96, 1

#define LOADOUT_PICKER_COLOR 0.47, 0.38, 0.45, 1

#define BLACK 0,0,0,1

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
#define infoBoxSelectorButtonW ((infoBoxOutlineBottomRightX - infoBoxOutlineTopLeftX) / 3)
#define infoBoxSelectorButtonH 3

#define teleportGroupY (infoBoxOutlineBottomRightY + infoBoxSelectorButtonH + teleportGroupVerticalPadding)

#define readyButtonY (teleportGroupY + teleportGroupHeight + readyButtonVerticalPadding)

#define dialogHeight (readyButtonY + readyButtonVerticalPadding + readyButtonHeight - dialogY)