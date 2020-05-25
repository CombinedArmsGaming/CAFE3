#include "../ui_macros.hpp"

class CA2_SquadMarker_Dialog
{
	idd = IDD_SQUADMARKER_DIALOG;
    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "_this call f_fnc_squadMarkerDialog_populateDialog;";
    onUnload = "_this call f_fnc_squadMarkerDialog_onCloseDialog;";

	class ControlsBackground
    {
		class RscText_1000: CA2_DefaultText
		{
			idc = 1000;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};

		class RscText_1005: CA2_DefaultText
		{
			idc = 1005;
			x = 21 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 14 * GUI_GRID_W;
			h = 13.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};

		class RscText_1009: CA2_DefaultText
		{
			idc = 1009;
			x = 6 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 29 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.5};
		};

	};


	class Controls
    {
		class CA2_SquadMarker_MarkerTitle: CA2_DefaultText
		{
			idc = 1001;
			text = "Edit your squad marker:";
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 1.3 * GUI_GRID_H;
		};

		class CA2_SquadMarker_GroupTitle: CA2_DefaultText
		{
			idc = 1002;
			text = "Group name:";
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

		class CA2_SquadMarker_GroupEdit: CA2_DefaultEdit
		{
			idc = IDC_SQUADMARKER_DIALOG_GROUPEDIT;
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

		class CA2_SquadMarker_IconTitle: CA2_DefaultText
		{
			idc = 1003;
			text = "Icon:";
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

		class CA2_SquadMarker_IconListBox: CA2_DefaultListBox
		{
			idc = IDC_SQUADMARKER_DIALOG_ICONLISTBOX;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 7 * GUI_GRID_H;
			sizeEx = 0.7 * GUI_GRID_H;
		};

		class CA2_SquadMarker_ColourTitle: CA2_DefaultText
		{
			idc = 1004;
			text = "Colour:";
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

		class CA2_SquadMarker_ColourListBox: CA2_DefaultListBox
		{
			idc = IDC_SQUADMARKER_DIALOG_COLOURLISTBOX;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 7 * GUI_GRID_H;
			sizeEx = 0.7 * GUI_GRID_H;
		};

		class CA2_SquadMarker_SpecialistTitle: CA2_DefaultText
		{
			idc = 1006;
			text = "Specialist markers:";
			x = 21.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 9.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 1.3 * GUI_GRID_H;
		};

		class CA2_SquadMarker_AvailableSpecialistTitle: CA2_DefaultText
		{
			idc = 1007;
			text = "Available:";
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

		class CA2_SquadMarker_AvailableSpecialistListBox: CA2_DefaultListBox
		{
			idc = IDC_SQUADMARKER_DIALOG_AVAILABLELISTBOX;
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 6.5 * GUI_GRID_H;
			sizeEx = 0.7 * GUI_GRID_H;
		};

		class CA2_SquadMarker_AddSpecialistButton: CA2_DefaultButton
		{
			idc = 1600;
			text = "Add";
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			onButtonClick = "_this call f_fnc_squadMarkerDialog_addSpecialist";
		};

		class CA2_SquadMarker_VisibleSpecialistTitle: CA2_DefaultText
		{
			idc = 1008;
			text = "Visible:";
			x = 28.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};

		class CA2_SquadMarker_VisibleSpecialistListBox: CA2_DefaultListBox
		{
			idc = IDC_SQUADMARKER_DIALOG_VISIBLELISTBOX;
			x = 28.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 6.5 * GUI_GRID_H;
			sizeEx = 0.7 * GUI_GRID_H;
		};

		class CA2_SquadMarker_RemoveSpecialistButton: CA2_DefaultButton
		{
			idc = 1601;
			text = "Remove";
			x = 28.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
            onButtonClick = "_this call f_fnc_squadMarkerDialog_removeSpecialist";
		};

		class CA2_SquadMarker_ConfirmButton: CA2_DefaultButton
		{
			idc = 1602;
			text = "Confirm";
			x = 28.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
            onButtonClick = "closeDialog 1";
		};
		
		class CA2_SquadMarker_CancelButton: CA2_DefaultButton
		{
			idc = 1603;
			text = "Cancel";
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
            onButtonClick = "closeDialog 2";
		};

		class CA2_SquadMarker_IShowedYouMyDialogPleaseRespond: CA2_DefaultText
		{
			idc = 1010;
			text = "Experimental squad marker dialog.  Any feedback?  Tell Bubbus.";
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 15 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 0.6 * GUI_GRID_H;
		};

	};

};
