#include "ui_macros.hpp"

#define GUI_GRID_X		(0)
#define GUI_GRID_Y		(0)
#define GUI_GRID_W		(0.025)
#define GUI_GRID_H		(0.04)

import RscMapControl;
import RscMapControlEmpty;

class CAFE_DefaultStructuredText
{
	access = 0;
	colorText[] = {1,1,1,1};
	deletable = 0;
	fade = 0;
	h = 0.035;
	idc = -1;
	shadow = 1;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	style = 0;
	text = "";
	type = 13;
	w = 0.1;
	x = 0;
	y = 0;

	class Attributes
	{
		align = "left";
		color = "#ffffff";
		colorLink = "#D09B43";
		font = "RobotoCondensed";
		shadow = 1;
	};

};




class CAFE_DefaultListBox : RscListBox
{
	access = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	autoScrollSpeed = -1;
	colorBackground[] = {0,0,0,0.3};
	colorDisabled[] = {1,1,1,0.25};
	colorPicture[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelect2Right[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	colorSelectRight[] = {0,0,0,1};
	colorShadow[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	colorTextRight[] = {1,1,1,1};
	deletable = 0;
	fade = 0;
	font = "RobotoCondensed";
	h = 0.3;
	maxHistoryDelay = 1;
	period = 1.2;
	rowHeight = 0;
	shadow = 0;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
	style = 16;
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	tooltipColorText[] = {1,1,1,1};
	type = 5;
	w = 0.3;
	x = 0;
	y = 0;
};




class CAFE_DefaultEdit : RscEdit
{
	access = 0;
	autocomplete = "";
	canModify = 1;
	colorBackground[] = {0,0,0,0};
	colorDisabled[] = {1,1,1,0.25};
	colorSelection[] =
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		1
	};
	colorText[] = {0.95,0.95,0.95,1};
	deletable = 0;
	fade = 0;
	font = "RobotoCondensed";
	h = 0.04;
	shadow = 2;
	size = 0.2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	style = "0x00 + 0x40";
	text = "";
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	tooltipColorText[] = {1,1,1,1};
	type = 2;
	w = 0.2;
	x = 0;
	y = 0;
};




class CAFE_DefaultButton : RscButton
{
    access = 0;
    borderSize = 0;
    colorBackground[] = {0,0,0,0.5};
    colorBackgroundActive[] = {0,0,0,1};
    colorBackgroundDisabled[] = {0,0,0,0.5};
    colorBorder[] = {0,0,0,1};
    colorDisabled[] = {1,1,1,0.25};
    colorFocused[] = {0,0,0,1};
    colorShadow[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    deletable = 0;
    fade = 0;
    font = "RobotoCondensed";
    h = 0.039216;
    idc = -1;
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;
    shadow = 2;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    style = 2;
    text = "";
    type = 1;
    url = "";
    w = 0.095589;
    x = 0;
    y = 0;

};



class CAFE_DefaultText : RscText
{
    access = 0;
    colorBackground[] = {0,0,0,0};
    colorShadow[] = {0,0,0,0.5};
    colorText[] = {1,1,1,1};
    deletable = 0;
    fade = 0;
    fixedWidth = 0;
    font = "RobotoCondensed";
    h = 0.037;
    idc = -1;
    linespacing = 1;
    shadow = 1;
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    style = 0;
    text = "";
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    tooltipColorText[] = {1,1,1,1};
    type = 0;
    w = 0.3;
    x = 0;
    y = 0;

};



class CAFE_CenteredText : RscText
{
    access = 0;
    colorBackground[] = {0,0,0,0};
    colorShadow[] = {0,0,0,0.5};
    colorText[] = {1,1,1,1};
    deletable = 0;
    fade = 0;
    fixedWidth = 0;
    font = "RobotoCondensed";
    h = 0.037;
    idc = -1;
    linespacing = 1;
    shadow = 1;
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    style = 2;
    text = "";
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    tooltipColorText[] = {1,1,1,1};
    type = 0;
    w = 0.3;
    x = 0;
    y = 0;

};




class CAFE_DefaultTextCheckBox
{
	idc = -1;
	type = 7;
	style = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	colorText[] = {1,0,0,1};
	color[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
    colorBackgroundActive[] = {0,0,0,1};
	colorTextSelect[] = {0,0.8.0.1};
	colorSelectedBg[] = {0,0,0,0.5};
	colorSelect[] = {0,0,0,1};
	colorTextDisable[] = {0.4,0.4,0.4,1};
	colorDisable[] = {0.4,0.4,0.4,1};
    colorFocused[] = {0,0,0,1};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	font = "RobotoCondensed";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	rows = 1;
	columns = 1;
	strings[] = {"UNCHECKED"};
	checked_strings[] = {"CHECKED"};
};




class CAFE_DefaultSlider
{
	access = 0;
	color[] = {1,1,1,0.8};
	colorActive[] = {1,1,1,1};
	deletable = 0;
	fade = 0;
	h = 0.025;
	shadow = 0;
	style = 1024;
	type = 3;
	w = 0.3;
	x = 0;
	y = 0;

};




class CAFE_DefaultCombo
{
	access = 0;
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	colorActive[] = {1,0,0,1};
	colorBackground[] = {0,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	colorPicture[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorScrollbar[] = {1,0,0,1};
	colorSelect[] = {0,0,0,1};
	colorSelect2Right[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.7};
	colorSelectRight[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorTextRight[] = {1,1,1,1};
	deletable = 0;
	fade = 0;
	font = "RobotoCondensed";
	h = 0.035;
	maxHistoryDelay = 1;
	shadow = 0;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
	style = "0x10 + 0x200";
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	tooltipColorText[] = {1,1,1,1};
	type = 4;
	w = 0.12;
	wholeHeight = 0.45;
	x = 0;
	y = 0;

	class ComboScrollBar
	{
		color[] = {1,1,1,1};
	};

};

/*

	Default controls used for the loadout, group picker, and respawn dialogs

*/

#include "\a3\ui_f\hpp\definecommongrids.inc"

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

class CAFE_InfoBoxSelectorButton : CAFE_DefaultButton {
	y = (infoBoxSelectorButtonY) * GRID_H + GRID_Y;
	w = (infoBoxSelectorButtonW) * GRID_W;
	h = (infoBoxSelectorButtonH) * GRID_H;
}

class CAFE_Background: CAFE_DefaultText  {
	x = (CENTER_X - dialogWidth/2) * GRID_W + GRID_X;
	y = dialogY * GRID_H + GRID_Y;
	w = dialogWidth * GRID_W;
	h = dialogHeight * GRID_H;
	colorBackground[] = {0,0,0,0.5};
};

// Control group containing all of the informational text at the top of the dialog
class CAFE_InfoTextControlGroup: RscControlsGroup {
	// Positioned such that it spans from the left edge of the info box border to the right
	x = (infoBoxOutlineTopLeftX) * GRID_W + GRID_X;
	y = infoTextY * GRID_H + GRID_Y;
	w = infoTextWidth * GRID_W;
	h = (infoTextLineHeight * 2) * GRID_H;
};

// Control containing info text at the top of the dialog
class CAFE_InfoText: CAFE_DefaultText {
	y = 0;
	h = infoTextLineHeight * 2 * GRID_H;
	sizeEx = 0.7*GRID_H;
};

class CAFE_InfoTextLeft: CAFE_InfoText
{
	style = ST_MULTI + ST_NO_RECT;
	x = 0;
	w = ticketsInfoWidth * GRID_W;
};
class CAFE_InfoTextCenter: CAFE_InfoText
{
	style = ST_MULTI + ST_NO_RECT + ST_CENTER;
	x = (infoTextWidth/2 - deathTimerWidth/2) * GRID_W;
	w = deathTimerWidth * GRID_W;
};
class CAFE_InfoTextRight: CAFE_InfoText
{
	style = ST_MULTI + ST_NO_RECT + ST_RIGHT;
	x = (infoTextWidth - waveInfoWidth) * GRID_W;
	w = waveInfoWidth * GRID_W;
};

class CAFE_InfoBoxTopBorder: CAFE_DefaultText
{
	idc = IDC_INFO_BOX_OUTLINE;
	x = 0;
	y = 0;
	w = (infoBoxOutlineBottomRightX - infoBoxOutlineTopLeftX) * GRID_W;
	h = (infoBoxOutlineWidth) * GRID_H;
	colorBackground[] = {BORDER_COLOR};
};
class CAFE_InfoBoxLeftBorder: CAFE_DefaultText
{
	idc = IDC_INFO_BOX_OUTLINE + 1;
	x = 0;
	y = 0;
	w = (infoBoxOutlineWidth) * GRID_W;
	h = (infoBoxOutlineBottomRightY - infoBoxOutlineTopLeftY) * GRID_H;
	colorBackground[] = {BORDER_COLOR};
};
class CAFE_InfoBoxBottomBorder: CAFE_DefaultText
{
	idc = IDC_INFO_BOX_OUTLINE + 2;
	x = 0;
	y = (infoBoxHeight + infoBoxOutlineWidth) * GRID_H;
	w = (infoBoxOutlineBottomRightX - infoBoxOutlineTopLeftX) * GRID_W;
	h = (infoBoxOutlineWidth) * GRID_H;
	colorBackground[] = {BORDER_COLOR};
};
class CAFE_InfoBoxRightBorder: CAFE_DefaultText
{
	idc = IDC_INFO_BOX_OUTLINE + 3;
	x = (infoBoxWidth * 2 + verticalBarrierWidth + infoBoxOutlineWidth) * GRID_W;
	y = 0;
	w = (infoBoxOutlineWidth) * GRID_W;
	h = (infoBoxOutlineBottomRightY - infoBoxOutlineTopLeftY) * GRID_H;
	colorBackground[] = {BORDER_COLOR};
};
class CAFE_InfoBoxBorderGroup: RscControlsGroup 
{
	x = infoBoxOutlineTopLeftX * GRID_W + GRID_X;
	y = infoBoxOutlineTopLeftY * GRID_H + GRID_Y;
	w = (infoBoxOutlineBottomRightX - infoBoxOutlineTopLeftX + 1) * GRID_W;
	h = (infoBoxOutlineBottomRightY - infoBoxOutlineTopLeftY + 1) * GRID_H;
};

class CAFE_VerticalBarrier: CAFE_DefaultText {
	x = (CENTER_X - verticalBarrierWidth/2) * GRID_W + GRID_X;
	y = (infoBoxY) * GRID_H + GRID_Y;
	w = verticalBarrierWidth * GRID_W;
	h = infoBoxHeight * GRID_H;
	colorBackground[] = {0.42, 0.42, 0.42, 1};
};

class CAFE_GroupInfoBoxesCtrlGroup: RscControlsGroup
{
	idc = IDC_GROUP_CT_GROUP;
	x = (CENTER_X - verticalBarrierWidth/2 - infoBoxWidth) * GRID_W + GRID_X;
	y = infoBoxY * GRID_H + GRID_Y;
	w = (infoBoxWidth * 2 + verticalBarrierWidth) * GRID_W;
	h = (infoBoxHeight) * GRID_H;
	class Controls 
	{
		class GroupListbox: CAFE_DefaultListBox
		{
			idc = IDC_GROUPSLIST;
			x = 0;
			y = 0;
			w = infoBoxWidth * GRID_W;
			h = infoBoxHeight * GRID_H;
			onLBSelChanged = "_this call f_fnc_groupsList_onLBSelChanged;";
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
			onLBSelChanged = "_this call f_fnc_listBoxDeselectWithoutScrolling";
		}
	};
};

class CAFE_LoadoutInfoBoxesCtrlGroup: RscControlsGroup
{
	idc = IDC_LOADOUT_CT_GROUP;
	x = (CENTER_X - verticalBarrierWidth/2 - infoBoxWidth) * GRID_W + GRID_X;
	y = infoBoxY * GRID_H + GRID_Y;
	w = (infoBoxWidth * 2 + verticalBarrierWidth) * GRID_W;
	h = (infoBoxHeight) * GRID_H;
	class Controls 
	{
		class LoadoutsListbox: CAFE_DefaultListBox
		{
			idc = IDC_LOADOUTSLIST;
			x = 0;
			y = 0;
			w = infoBoxWidth * GRID_W;
			h = infoBoxHeight * GRID_H;
			onLBSelChanged = "_this call f_fnc_loadoutsList_onLBSelChanged;";
			onLoad = "_this call f_fnc_populateLoadoutsList"
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
			onLBSelChanged = "_this call f_fnc_listBoxDeselectWithoutScrolling";
		}
	};
}

// These info boxes can't be in a controls group because CT_MAP_MAIN controls don't allow it
class CAFE_SpawnpointListbox: CAFE_DefaultListBox
{
	idc = IDC_SPAWNLIST;
	x = (CENTER_X - verticalBarrierWidth/2 - infoBoxWidth) * GRID_W + GRID_X;
	y = infoBoxY * GRID_H + GRID_Y;
	w = infoBoxWidth * GRID_W;
	h = infoBoxHeight * GRID_H;
	sizeEx = 1 * GRID_H;
}
class CAFE_MapInfoBox: RscMapControl
{
	idc = IDC_RESPAWN_MAP;
	x = (CENTER_X + verticalBarrierWidth/2) * GRID_W + GRID_X;
	y = infoBoxY * GRID_H + GRID_Y;
	w = infoBoxWidth * GRID_W;
	h = infoBoxHeight * GRID_H;
}

class CAFE_TeleportToSquadCtrlGroup: RscControlsGroup 
{
	x = (CENTER_X - teleportGroupWidth/2) * GRID_W + GRID_X;
	y = teleportGroupY * GRID_H + GRID_Y;
	w = teleportGroupWidth * GRID_W;
	h = teleportGroupHeight * GRID_H;
	class Controls 
	{
		class TeleportTitle: CAFE_DefaultText
		{
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
class CAFE_ReadyButton: CAFE_DefaultButton
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

class CAFE_CancelButton: CAFE_DefaultButton
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


// Hardcode again to avoid messing with any other UIs that use this
#define GUI_GRID_X		(0)
#define GUI_GRID_Y		(0)
#define GUI_GRID_W		(0.025)
#define GUI_GRID_H		(0.04)