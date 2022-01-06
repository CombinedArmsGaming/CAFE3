#include "../ui_macros.hpp"

class CAFE_ViewDistance_Dialog
{
	idd = IDD_VIEWDISTANCE_DIALOG;
    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "_this call f_fnc_viewDistanceEditor_populateDialog;";
    onUnload = "_this call f_fnc_viewDistanceEditor_onCloseDialog;";

	class ControlsBackground
    {
        class CAFE_ViewDistance_Background: CAFE_DefaultText
        {
        	idc = 1000;
        	x = 11 * GUI_GRID_W + GUI_GRID_X;
        	y = 4 * GUI_GRID_H + GUI_GRID_Y;
        	w = 18 * GUI_GRID_W;
        	h = 15 * GUI_GRID_H;
        	colorBackground[] = {0,0,0,0.5};
        };

        class CAFE_ViewDistance_Feedback: CAFE_DefaultText
        {
        	idc = 1006;
        	text = "Experimental view distance dialog.  Feedback?  Tell Bubbus.";
        	x = 11 * GUI_GRID_W + GUI_GRID_X;
        	y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 18 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        	colorBackground[] = {0,0,0,0.5};
        	sizeEx = 0.6 * GUI_GRID_H;
        };

    };


    class Controls
    {

        class CAFE_ViewDistance_Title: CAFE_DefaultText
        {
        	idc = 1001;
        	text = "View distance editor:";
        	x = 11.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 15.5 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;
        	sizeEx = 1.3 * GUI_GRID_H;
        };

        class CAFE_ViewDistance_TerrainDistanceTitle: CAFE_DefaultText
        {
        	idc = 1002;
        	text = "Terrain distance:";
        	x = 12 * GUI_GRID_W + GUI_GRID_X;
        	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 7.5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        	sizeEx = 0.7 * GUI_GRID_H;
        };

        class CAFE_ViewDistance_TerrainDistanceSlider: CAFE_DefaultSlider
        {
        	idc = IDC_VIEWDISTANCE_TERRAINSLIDER;
        	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 12.5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CAFE_ViewDistance_TerrainDistanceValue: CAFE_DefaultText
        {
        	idc = IDC_VIEWDISTANCE_TERRAINVALUE;
        	text = "";
        	x = 25.3 * GUI_GRID_W + GUI_GRID_X;
        	y = 7.3 * GUI_GRID_H + GUI_GRID_Y;
        	w = 3 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CAFE_ViewDistance_ObjectDistanceTitle: CAFE_DefaultText
        {
        	idc = 1003;
        	text = "Object distance:";
        	x = 12 * GUI_GRID_W + GUI_GRID_X;
        	y = 9 * GUI_GRID_H + GUI_GRID_Y;
        	w = 5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        	sizeEx = 0.7 * GUI_GRID_H;
        };

        class CAFE_ViewDistance_ObjectDistanceSlider: CAFE_DefaultSlider
        {
        	idc = IDC_VIEWDISTANCE_OBJECTSLIDER;
        	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 10 * GUI_GRID_H + GUI_GRID_Y;
        	w = 12.5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CAFE_ViewDistance_ObjectDistanceValue: CAFE_DefaultText
        {
        	idc = IDC_VIEWDISTANCE_OBJECTVALUE;
        	text = "";
        	x = 25.3 * GUI_GRID_W + GUI_GRID_X;
        	y = 9.8 * GUI_GRID_H + GUI_GRID_Y;
        	w = 3 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CAFE_ViewDistance_ShadowDistanceTitle: CAFE_DefaultText
        {
        	idc = 1004;
        	text = "Shadow distance:";
        	x = 12 * GUI_GRID_W + GUI_GRID_X;
        	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        	sizeEx = 0.7 * GUI_GRID_H;
        };

        class CAFE_ViewDistance_ShadowDistanceSlider: CAFE_DefaultSlider
        {
        	idc = IDC_VIEWDISTANCE_SHADOWSLIDER;
        	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 12.5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CAFE_ViewDistance_ShadowDistanceValue: CAFE_DefaultText
        {
        	idc = IDC_VIEWDISTANCE_SHADOWVALUE;
        	text = "";
        	x = 25.3 * GUI_GRID_W + GUI_GRID_X;
        	y = 12.3 * GUI_GRID_H + GUI_GRID_Y;
        	w = 3 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CAFE_ViewDistance_TerrainDetailTitle: CAFE_DefaultText
        {
        	idc = 1005;
        	text = "Terrain detail level:";
        	x = 12 * GUI_GRID_W + GUI_GRID_X;
        	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 5.5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        	sizeEx = 0.7 * GUI_GRID_H;
        };

        class CAFE_ViewDistance_TerrainDetailCombo: CAFE_DefaultCombo
        {
        	idc = IDC_VIEWDISTANCE_TERRAINCOMBO;
        	x = 18 * GUI_GRID_W + GUI_GRID_X;
        	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 10 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CAFE_ViewDistance_ConfirmButton: CAFE_DefaultButton
        {
        	idc = 1600;
        	text = "Confirm";
        	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 17 * GUI_GRID_H + GUI_GRID_Y;
        	w = 5 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;
            onButtonClick = "closeDialog 1";
        };

        class CAFE_ViewDistance_DismissButton: CAFE_DefaultButton
        {
        	idc = 1601;
        	text = "Dismiss";
        	x = 20.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 17 * GUI_GRID_H + GUI_GRID_Y;
        	w = 5 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;
            onButtonClick = "closeDialog 2";
        };

    };

};
