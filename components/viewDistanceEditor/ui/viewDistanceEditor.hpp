#include "../ui_macros.hpp"

class CA2_ViewDistance_Dialog
{
	idd = IDD_VIEWDISTANCE_DIALOG;
    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "_this call f_fnc_viewDistanceEditor_populateDialog;";
    onUnload = "_this call f_fnc_viewDistanceEditor_onCloseDialog;";

	class ControlsBackground
    {
        class CA2_ViewDistance_Background: CA2_DefaultText
        {
        	idc = 1000;
        	x = 11 * GUI_GRID_W + GUI_GRID_X;
        	y = 4 * GUI_GRID_H + GUI_GRID_Y;
        	w = 18 * GUI_GRID_W;
        	h = 15 * GUI_GRID_H;
        	colorBackground[] = {0,0,0,0.5};
        };

        class CA2_ViewDistance_Feedback: CA2_DefaultText
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

        class CA2_ViewDistance_Title: CA2_DefaultText
        {
        	idc = 1001;
        	text = "View distance editor:";
        	x = 11.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 15.5 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;
        	sizeEx = 1.3 * GUI_GRID_H;
        };

        class CA2_ViewDistance_TerrainDistanceTitle: CA2_DefaultText
        {
        	idc = 1002;
        	text = "Terrain distance:";
        	x = 12 * GUI_GRID_W + GUI_GRID_X;
        	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 7.5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        	sizeEx = 0.7 * GUI_GRID_H;
        };

        class CA2_ViewDistance_TerrainDistanceSlider: CA2_DefaultSlider
        {
        	idc = IDC_VIEWDISTANCE_TERRAINSLIDER;
        	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 12.5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CA2_ViewDistance_TerrainDistanceValue: CA2_DefaultText
        {
        	idc = IDC_VIEWDISTANCE_TERRAINVALUE;
        	text = "";
        	x = 25.3 * GUI_GRID_W + GUI_GRID_X;
        	y = 7.3 * GUI_GRID_H + GUI_GRID_Y;
        	w = 3 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CA2_ViewDistance_ObjectDistanceTitle: CA2_DefaultText
        {
        	idc = 1003;
        	text = "Object distance:";
        	x = 12 * GUI_GRID_W + GUI_GRID_X;
        	y = 9 * GUI_GRID_H + GUI_GRID_Y;
        	w = 5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        	sizeEx = 0.7 * GUI_GRID_H;
        };

        class CA2_ViewDistance_ObjectDistanceSlider: CA2_DefaultSlider
        {
        	idc = IDC_VIEWDISTANCE_OBJECTSLIDER;
        	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 10 * GUI_GRID_H + GUI_GRID_Y;
        	w = 12.5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CA2_ViewDistance_ObjectDistanceValue: CA2_DefaultText
        {
        	idc = IDC_VIEWDISTANCE_OBJECTVALUE;
        	text = "";
        	x = 25.3 * GUI_GRID_W + GUI_GRID_X;
        	y = 9.8 * GUI_GRID_H + GUI_GRID_Y;
        	w = 3 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CA2_ViewDistance_ShadowDistanceTitle: CA2_DefaultText
        {
        	idc = 1004;
        	text = "Shadow distance:";
        	x = 12 * GUI_GRID_W + GUI_GRID_X;
        	y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        	sizeEx = 0.7 * GUI_GRID_H;
        };

        class CA2_ViewDistance_ShadowDistanceSlider: CA2_DefaultSlider
        {
        	idc = IDC_VIEWDISTANCE_SHADOWSLIDER;
        	x = 12.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 12.5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CA2_ViewDistance_ShadowDistanceValue: CA2_DefaultText
        {
        	idc = IDC_VIEWDISTANCE_SHADOWVALUE;
        	text = "";
        	x = 25.3 * GUI_GRID_W + GUI_GRID_X;
        	y = 12.3 * GUI_GRID_H + GUI_GRID_Y;
        	w = 3 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CA2_ViewDistance_TerrainDetailTitle: CA2_DefaultText
        {
        	idc = 1005;
        	text = "Terrain detail level:";
        	x = 12 * GUI_GRID_W + GUI_GRID_X;
        	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 5.5 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        	sizeEx = 0.7 * GUI_GRID_H;
        };

        class CA2_ViewDistance_TerrainDetailCombo: CA2_DefaultCombo
        {
        	idc = IDC_VIEWDISTANCE_TERRAINCOMBO;
        	x = 18 * GUI_GRID_W + GUI_GRID_X;
        	y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
        	w = 10 * GUI_GRID_W;
        	h = 1 * GUI_GRID_H;
        };

        class CA2_ViewDistance_ConfirmButton: CA2_DefaultButton
        {
        	idc = 1600;
        	text = "Confirm";
        	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
        	y = 17 * GUI_GRID_H + GUI_GRID_Y;
        	w = 5 * GUI_GRID_W;
        	h = 1.5 * GUI_GRID_H;
            onButtonClick = "closeDialog 1";
        };

        class CA2_ViewDistance_DismissButton: CA2_DefaultButton
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
