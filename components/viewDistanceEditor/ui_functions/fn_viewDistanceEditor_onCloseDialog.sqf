#include "macros.hpp"

disableSerialization;

params ["_display", "_exitCode"];


if (_exitCode == 2) exitWith {};


if (_exitCode == 1) then
{
    _terrainDistSlider = _display displayCtrl IDC_VIEWDISTANCE_TERRAINSLIDER;
    _terrainDistValue = sliderPosition _terrainDistSlider;

    _objectDistSlider = _display displayCtrl IDC_VIEWDISTANCE_OBJECTSLIDER;
    _objectDistValue = sliderPosition _objectDistSlider;

    _shadowDistSlider = _display displayCtrl IDC_VIEWDISTANCE_SHADOWSLIDER;
    _shadowDistValue = sliderPosition _shadowDistSlider;

    _terrainDetailCombo = _display displayCtrl IDC_VIEWDISTANCE_TERRAINCOMBO;
    _detailChoice = lbCurSel _terrainDetailCombo;
    _detailValue = f_var_viewDistanceEditor_terainDetailValues param [_detailChoice, 25];

    setViewDistance _terrainDistValue;
    setObjectViewDistance [_objectDistValue, _shadowDistValue];
    setTerrainGrid _detailValue;

};
