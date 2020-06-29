#include "macros.hpp"

disableSerialization;

params ["_display"];

_objDistRetVals = getObjectViewDistance;

_curViewDist = viewDistance;
_curObjectDist = _objDistRetVals select 0;
_curShadowDist = _objDistRetVals select 1;
_curTerrainDetail = getTerrainGrid;


// Terrain distance editing:

_terrainDistSlider = _display displayCtrl IDC_VIEWDISTANCE_TERRAINSLIDER;
_terrainDistSlider sliderSetRange [500, 12000];
_terrainDistSlider sliderSetSpeed [1000, 500];
_terrainDistSlider sliderSetPosition _curViewDist;
_terrainDistSlider ctrlAddEventHandler ["SliderPosChanged",
{
    params ["_slider", "_value"];

    _display = findDisplay IDD_VIEWDISTANCE_DIALOG;

    _terrainDistValue = _display displayCtrl IDC_VIEWDISTANCE_TERRAINVALUE;
    _terrainDistValue ctrlSetText (str round _value);

}];

_terrainDistValue = _display displayCtrl IDC_VIEWDISTANCE_TERRAINVALUE;
_terrainDistValue ctrlSetText (str round _curViewDist);


// Object distance editing:

_objectDistSlider = _display displayCtrl IDC_VIEWDISTANCE_OBJECTSLIDER;
_objectDistSlider sliderSetRange [500, 12000];
_objectDistSlider sliderSetSpeed [1000, 500];
_objectDistSlider sliderSetPosition _curObjectDist;
_objectDistSlider ctrlAddEventHandler ["SliderPosChanged",
{
    params ["_slider", "_value"];

    _display = findDisplay IDD_VIEWDISTANCE_DIALOG;

    _objectDistValue = _display displayCtrl IDC_VIEWDISTANCE_OBJECTVALUE;
    _objectDistValue ctrlSetText (str round _value);

}];

_objectDistValue = _display displayCtrl IDC_VIEWDISTANCE_OBJECTVALUE;
_objectDistValue ctrlSetText (str round _curObjectDist);


// Shadow distance editing:

_shadowDistSlider = _display displayCtrl IDC_VIEWDISTANCE_SHADOWSLIDER;
_shadowDistSlider sliderSetRange [50, 1000];
_shadowDistSlider sliderSetSpeed [100, 50];
_shadowDistSlider sliderSetPosition _curShadowDist;
_shadowDistSlider ctrlAddEventHandler ["SliderPosChanged",
{
    params ["_slider", "_value"];

    _display = findDisplay IDD_VIEWDISTANCE_DIALOG;

    _shadowDistValue = _display displayCtrl IDC_VIEWDISTANCE_SHADOWVALUE;
    _shadowDistValue ctrlSetText (str round _value);

}];

_shadowDistValue = _display displayCtrl IDC_VIEWDISTANCE_SHADOWVALUE;
_shadowDistValue ctrlSetText (str round _curShadowDist);


// Terrain detail editing:

_terrainCombo = _display displayCtrl IDC_VIEWDISTANCE_TERRAINCOMBO;

{
    _terrainCombo lbAdd _x;

} forEach f_var_viewDistanceEditor_terainDetailChoices;

_curGridIdx = (f_var_viewDistanceEditor_terainDetailValues findIf {_x isEqualTo _curTerrainDetail});

if (_curGridIdx >= 0) then
{
    _terrainCombo lbSetCurSel _curGridIdx;
};
