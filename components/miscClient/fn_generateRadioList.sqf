#include "macros.hpp"

CLIENT_ONLY;

params ["_side", ["_scale", 1]];

_sideColour = switch (_side) do
{
    case "blufor": {"ColorWEST"};
    case "opfor": {"ColorEAST"};
    case "indfor": {"ColorIndependent"};
    default {"ColorBlack"};
};


_oldMarkers = missionNamespace getVariable ["f_arr_radioList_markers", []];

if !(_oldMarkers isEqualTo []) then
{
    {
        deleteMarkerLocal _x;

    } forEach _oldMarkers;

};


_shortRangeVariable = format ["f_radios_settings_acre2_sr_groups_%1", _side];
_shortRangeConfig = missionNamespace getVariable [_shortRangeVariable, []];

_shortRangeList = [];

if (_shortRangeConfig isEqualTo []) then
{
     _shortRangeList pushBack "No short-range channels.";
}
else
{
    {
        _shortRangeList pushBack format ["Channel #%1: %2", _forEachIndex + 1, _x select 0];

    } forEach _shortRangeConfig;

};


_longRangeVariable = format ["f_radios_settings_acre2_lr_groups_%1", _side];
_longRangeConfig = missionNamespace getVariable [_longRangeVariable, []];

_longRangeList = [];

if (_longRangeConfig isEqualTo []) then
{
     _longRangeList pushBack "No long-range channels.";
}
else
{
    {
        _longRangeList pushBack format ["Channel #%1: %2", _forEachIndex + 1, _x select 0];

    } forEach _longRangeConfig;

};


_configMarkerName = "radio_list";

if !(getMarkerColor _configMarkerName == "") then
{
    _scale = (getMarkerSize _configMarkerName) select 0;
};

_verticalStep = 50 * _scale;
_totalHeight = _verticalStep * (count _shortRangeList + count _longRangeList + 6);

_topLeftCorner = getMarkerPos _configMarkerName;

if (_topLeftCorner isEqualTo [0,0,0]) then
{
    _topLeftCorner = [0,_totalHeight,0];
};

_markerNames = [];
_curPos = _topLeftCorner;
#define STEP_DOWN _curPos = _curPos vectorAdd [0,-_verticalStep,0];
#define STEP_RIGHT _curPos = _curPos vectorAdd [_verticalStep,0,0];
#define STEP_LEFT _curPos = _curPos vectorAdd [-_verticalStep,0,0];

//create list background
_markerName = format ["radio_list_bg_%1", _side];
createMarkerLocal [_markerName, _curPos vectorAdd [_verticalStep * 4, _totalHeight * -0.5, 0]];
_markerNames pushBack _markerName;
_markerName setMarkerShapeLocal "RECTANGLE";
_markerName setMarkerBrushLocal "SolidBorder";
_markerName setMarkerColorLocal "ColorWhite";
_markerName setMarkerSizeLocal [_verticalStep * 4, _totalHeight * 0.5];

//create list side-strip
_markerName = format ["radio_list_strip_%1", _side];
createMarkerLocal [_markerName, _curPos vectorAdd [-_verticalStep * 0.1, _totalHeight * -0.5, 0]];
_markerNames pushBack _markerName;
_markerName setMarkerShapeLocal "RECTANGLE";
_markerName setMarkerBrushLocal "Solid";
_markerName setMarkerColorLocal _sideColour;
_markerName setMarkerSizeLocal [_verticalStep * 0.1, _totalHeight * 0.5];

STEP_DOWN
STEP_RIGHT


//create radios header
_markerName = format ["radio_header_%1", _side];
createMarkerLocal [_markerName, _curPos];
_markerNames pushBack _markerName;
STEP_DOWN

_markerName setMarkerTypeLocal "mil_dot";
_markerName setMarkerTextLocal format ["%1 Radio list:", toUpper _side];


//create lr header
_markerName = format ["radio_lr_header_%1", _side];
createMarkerLocal [_markerName, _curPos];
_markerNames pushBack _markerName;

_markerName setMarkerTypeLocal "mil_dot";
_markerName setMarkerTextLocal "Long-range channels (148/152s):";
STEP_DOWN

STEP_RIGHT
{
    _markerName = format ["radio_lr_%1_%2", _side, _forEachIndex];
    createMarkerLocal [_markerName, _curPos];
    _markerNames pushBack _markerName;

    _markerName setMarkerTypeLocal "mil_dot";
    _markerName setMarkerTextLocal _x;
    STEP_DOWN

} forEach _longRangeList;
STEP_LEFT

STEP_DOWN


//create sr header
_markerName = format ["radio_sr_header_%1", _side];
createMarkerLocal [_markerName, _curPos];
_markerNames pushBack _markerName;

_markerName setMarkerTypeLocal "mil_dot";
_markerName setMarkerTextLocal "Short-range channels (343s):";
STEP_DOWN

STEP_RIGHT
{
    _markerName = format ["radio_sr_%1_%2", _side, _forEachIndex];
    createMarkerLocal [_markerName, _curPos];
    _markerNames pushBack _markerName;
    STEP_DOWN

    _markerName setMarkerTypeLocal "mil_dot";
    _markerName setMarkerTextLocal _x;

} forEach _shortRangeList;
STEP_LEFT


missionNamespace setVariable ["f_arr_radioList_markers", _markerNames];
