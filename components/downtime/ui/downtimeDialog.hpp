#include "..\macros.hpp"

class CA2_Downtime_Dialog
{
    idd = 12143;
    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "[] call f_fnc_downtimeDialog_setupTempVars;";
    onUnload = "_this call f_fnc_downtimeDialog_exitDialog;";

    class ControlsBackground
    {
        class CA2_Downtime_Background: CA2_DefaultText
        {
        	idc = 1000;
        	x = 8 * GUI_GRID_W + GUI_GRID_X;
        	y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 24 * GUI_GRID_W;
        	h = 11.5 * GUI_GRID_H;
        	colorBackground[] = {0,0,0,0.5};
        };

        class CA2_Downtime_Title: CA2_DefaultText
        {
        	idc = 1001;
        	text = "This might take a while...";
        	x = 8 * GUI_GRID_W + GUI_GRID_X;
        	y = 6 * GUI_GRID_H + GUI_GRID_Y;
        	w = 24 * GUI_GRID_W;
        	h = 2 * GUI_GRID_H;
        	colorBackground[] = {0,0,0,0.5};
        	sizeEx = 1.6 * GUI_GRID_H;
            style = ST_CENTER;

            onLoad = "_this call f_fnc_downtimeDialog_setupTitleText;"
        };

    };

    class Controls
    {

        class CA2_Downtime_ActivityHeader: CA2_DefaultText
        {
        	idc = 1002;
        	text = "Choose a downtime activity:";
        	x = 9 * GUI_GRID_W + GUI_GRID_X;
        	y = 9 * GUI_GRID_H + GUI_GRID_Y;
        	w = 22 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CA2_Downtime_SpectateButton: CA2_DefaultButton
        {
        	idc = 1600;
        	text = "Spectate";
        	x = 9.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 6 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;
        	tooltip = "Look around and talk to spectators until you're up again.";

            onLoad = "_this call f_fnc_downtimeDialog_setupButton;";
            onButtonClick = "f_var_downtimeDialog_selectedActivity = 'f_fnc_downtimeSpectate'; ['activity'] call f_fnc_downtimeDialog_updateButtonGroup;";
        };

        class CA2_Downtime_ControlButton: CA2_DefaultButton
        {
        	idc = 1601;
        	text = "Control an AI";
        	x = 17 * GUI_GRID_W + GUI_GRID_X;
        	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 6 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;
        	tooltip = "Control a%1 unit until you're up again.";

            onLoad = "_this call f_fnc_downtimeDialog_setupButton; _this call f_fnc_downtimeDialog_setupControlTooltip"
            onButtonClick = "f_var_downtimeDialog_selectedActivity = 'f_fnc_downtimeControl'; ['activity'] call f_fnc_downtimeDialog_updateButtonGroup;";
        };

        class CA2_Downtime_NothingButton: CA2_DefaultButton
        {
        	idc = 1602;
        	text = "Do nothing";
        	x = 24.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 6 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;
        	tooltip = "Hey, sometimes we've got better things to do.  If you die you'll become a spectator.";

            onLoad = "_this call f_fnc_downtimeDialog_setupButton;"
            onButtonClick = "f_var_downtimeDialog_selectedActivity = 'f_fnc_downtimeDoNothing'; ['activity'] call f_fnc_downtimeDialog_updateButtonGroup;";
        };

        class CA2_Downtime_ConsentHeader: CA2_DefaultText
        {
        	idc = 1003;
        	text = "If you die, when do you want to respawn?";
        	x = 9 * GUI_GRID_W + GUI_GRID_X;
        	y = 13 * GUI_GRID_H + GUI_GRID_Y;
        	w = 22 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CA2_Downtime_AlwaysRespawnButton: CA2_DefaultButton
        {
        	idc = 1603;
        	text = "As soon as possible";
        	x = 9.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 9.5 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;
        	tooltip = "You will respawn when your commander spends tickets or uses a spawn wave.";

            onLoad = "_this call f_fnc_downtimeDialog_setupButton;"
            onButtonClick = "f_var_downtimeDialog_selectedRespawnMode = 'respawnAlways'; ['respawn'] call f_fnc_downtimeDialog_updateButtonGroup;";
        };

        class CA2_Downtime_RespawnWithConsentButton: CA2_DefaultButton
        {
        	idc = 1604;
        	text = "Only when I want to";
        	x = 21 * GUI_GRID_W + GUI_GRID_X;
        	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 9.5 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;
        	tooltip = "When respawn is available, you will need to actively opt-in.\nBe warned: you may miss opportunities to respawn.";

            onLoad = "_this call f_fnc_downtimeDialog_setupButton;"
            onButtonClick = "f_var_downtimeDialog_selectedRespawnMode = 'respawnWithConsent'; ['respawn'] call f_fnc_downtimeDialog_updateButtonGroup;";
        };

        class CA2_Downtime_ConfirmButton: CA2_DefaultButton
        {
        	idc = 1605;
        	text = "Confirm";
        	x = 9.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 5 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;
        	tooltip = "Save the changes you've made above.";

            onButtonClick = "closeDialog 3";
        };

        class CA2_Downtime_DismissButton: CA2_DefaultButton
        {
        	idc = 1606;
        	text = "Dismiss";
        	x = 26 * GUI_GRID_W + GUI_GRID_X;
        	y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 4.5 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;
        	tooltip = "Dismiss any changes made above and keep any previous settings.";

            onButtonClick = "closeDialog 4";
        };
    };

};
