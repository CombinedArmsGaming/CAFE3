#include "../ui_macros.hpp"

class CAFE_DowntimeControlsGroup : RscControlsGroupNoScrollbars
{
    idc = 49690;
	#ifdef ENABLE_RESPAWN_DIALOG
	x = (safeZoneW + safeZoneX) - (safeZoneW * 0.25);
	w = safeZoneW * 0.25;
	#else
	x = (safeZoneW + safeZoneX) - (safeZoneW * 0.06);
	w = safeZoneW * 0.06;
	#endif
    y = safeZoneY + (safeZoneH * 0.00);
    h = safeZoneH * 0.07;
    class Controls
    {
        class DowntimeBackground: CAFE_DefaultText
        {
            idc = 49691;
            x = 0;
            y = 0;
			#ifdef ENABLE_RESPAWN_DIALOG
            w = safeZoneW * 0.25;
			#else 
			w = safeZoneW * 0.06;
			#endif
            h = safeZoneH * 0.07;
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class YouAreText: CAFE_DefaultText
        {
            idc = 49692;
            x = safeZoneW * 0.002;
            y = safeZoneH * 0.005;
            w = safeZoneW * 0.05;
            h = safeZoneH * 0.02;
            text = "You are";
            font = "RobotoCondensed";
            sizeEx = 0.03;
        };
        class DownIndicator: CAFE_DefaultText
        {
            idc = 49693;
            x = 0;
            y = safeZoneH * 0.015;
            w = safeZoneW * 0.06;
            h = safeZoneH * 0.05;
            text = "DEAD";
            colorText[] = {1, 0.7, 0.7, 1};
            font = "PuristaBold";
            sizeEx = 0.075;
        };
		#ifdef ENABLE_RESPAWN_DIALOG
        class ChooseSpawnButton: CAFE_DefaultButton
        {
            idc = 49694;
            x = safeZoneW * 0.08;
            y = safeZoneH * 0.01;
            w = safeZoneW * 0.165;
            h = safeZoneH * 0.035;
            colorBackground[] = {0.65, 0.39, 0.05, 1};
            colorFocused[] = {0.65, 0.39, 0.05, 1};
            colorFocused2[] = {0.65, 0.39, 0.05, 1};
            onButtonClick = "[] call f_fnc_tryShowSpawnpointDialog";
            text = "CHOOSE SPAWN LOCATION";
        }
        class ChooseSpawnButtonText: CAFE_CenteredText
        {
            idc = 49695;
            x = safeZoneW * 0.08;
            y = safeZoneH * 0.047;
            w = safeZoneW * 0.165;
            h = safeZoneH * 0.02;
            text = "(Or press CTRL + S !)";
            sizeEx = 0.03;

        }
		#endif
    }
}

