#define GUI_GRID_X		(0)
#define GUI_GRID_Y		(0)
#define GUI_GRID_W		(0.025)
#define GUI_GRID_H		(0.04)

class CA2_DefaultButton : RscButton
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
    sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
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

}



class CA2_DefaultText : RscText
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
    SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    style = 0;
    text = "";
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    tooltipColorText[] = {1,1,1,1};
    type = 0;
    w = 0.3;
    x = 0;
    y = 0;

}
