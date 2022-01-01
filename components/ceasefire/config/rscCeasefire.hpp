#include "macros.hpp"





// Derived control types
class CAFE_Ceasefire_RscText : RscText {
        style = ST_CENTER;
	font = "PuristaMedium";
        SizeEx = 0.015 * safeZoneW;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	colorText[] = CURLY(MACRO_COLOUR_A100_WHITE);
};

class CAFE_Ceasefire_RscBox : RscBox {
	shadow = 0;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
};

class CAFE_Ceasefire_RscPicture : RscPicture {
	style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
};





class CAFE_RscCeasefire {
	idd = -1;
	fadeIn = 0;
	fadeOut = 0;
	duration = 999999;
	movingEnable = 0;
	movingEnabled = 0;
	name = "CAFE_RscCeasefire";
	onLoad = "uiNamespace setVariable ['CAFE_RscCeasefire', _this select 0]";

	class controls {

		// Background Controls Group
		class Background_CtrlGrp : RscControlsGroupNoScrollbars {
			idc = MACRO_IDC_CF_CTRLGROUP;
			x = safeZoneX + (0.5 - MACRO_POS_CF_WIDTH * 0.5) * safezoneW;
			y = safeZoneY;
			w = MACRO_POS_CF_WIDTH * safeZoneW;
			h = MACRO_POS_CF_HEIGHT * safeZoneW;

			class controls {

				class Background : CAFE_Ceasefire_RscBox {
					idc = MACRO_IDC_CF_BACKGROUND;
					w = MACRO_POS_CF_WIDTH * safeZoneW;
					h = MACRO_POS_CF_HEIGHT * safeZoneW;
					colorBackground[] = CURLY(MACRO_COLOUR_BACKGROUND);
				};

				// Warning text
				class Title : CAFE_Ceasefire_RscText {
					text = "CEASEFIRE";
					w = MACRO_POS_CF_WIDTH * safeZoneW;
					h = MACRO_POS_CF_HEIGHT * 0.3 * safeZoneW;
					colorText[] = CURLY(MACRO_COLOUR_A100_ORANGE);
				};

				// Countdown text
				class Countdown : CAFE_Ceasefire_RscText {
					idc = MACRO_IDC_CF_COUNTDOWN;
					text = "00:00";
					font = "EtelkaMonospaceProBold";
					SizeEx = 0.025 * safeZoneW;
					x = MACRO_POS_CF_ICON_WIDTH * safeZoneW;
					y = MACRO_POS_CF_HEIGHT * 0.3 * safeZoneW;
					w = (MACRO_POS_CF_WIDTH - MACRO_POS_CF_ICON_WIDTH * 2) * safeZoneW;
					h = MACRO_POS_CF_HEIGHT * 0.4 * safeZoneW;
				};

				// Description text
				class Description : CAFE_Ceasefire_RscText {
					idc = MACRO_IDC_CF_DESCRIPTION;
					text = "Safe start";
					y = MACRO_POS_CF_HEIGHT * 0.7 * safeZoneW;
					w = MACRO_POS_CF_WIDTH * safeZoneW;
					h = MACRO_POS_CF_HEIGHT * 0.3 * safeZoneW;
				};

				// Icon left
				class Icon_Left : CAFE_Ceasefire_RscPicture {
					text = "a3\ui_f\data\Map\Markers\Military\warning_CA.paa";
					x = MACRO_POS_CF_ICON_GAP * safeZoneW;
					w = (MACRO_POS_CF_ICON_WIDTH - MACRO_POS_CF_ICON_GAP * 2) * safeZoneW;
					h = MACRO_POS_CF_HEIGHT * safeZoneW;
					colorText[] = CURLY(MACRO_COLOUR_A100_ORANGE);
				};

				// Icon right
				class Icon_Right : Icon_Left {
					x = (MACRO_POS_CF_WIDTH + MACRO_POS_CF_ICON_GAP - MACRO_POS_CF_ICON_WIDTH) * safeZoneW;
				};
			};
		};
	};
};
