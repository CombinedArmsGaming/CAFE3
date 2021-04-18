#include "macros.hpp"
#include "../../missionIntro_macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_tilesMissionIntro);

_textArray = switch (f_var_missionIntro_type) do
{
    case (MISSIONINTRO_CUSTOM):
    {
        f_arr_missionIntroLines
    };

    case (MISSIONINTRO_FULL):
    {
        [
            [MISSION_NAME, "PuristaBold", 2],
            [MISSION_SUBTITLE, "PuristaBold", 1.3],
            [["By ", MISSION_AUTHOR], "PuristaBold", 1.2],
            [[MISSION_DATE_AND_TIME], "RobotoCondensed", 1]
        ]
    };

    case (MISSIONINTRO_DEFAULT):
    {
        [
            [MISSION_NAME, "PuristaBold", 2],
            [MISSION_SUBTITLE, "RobotoCondensed", 1]
        ]
    };

};


#define MISSION_NAME "#MishName"
#define MISSION_SUBTITLE "#MishTitle"
#define MISSION_AUTHOR "#MishMaker"
#define MISSION_DATE "#MishDate"
#define MISSION_TIME "#MishTime"
#define MISSION_LOCATION "#MishLocation"
#define MISSION_DATE_AND_TIME "#MishDateTime"


_structuredTextLines = [];

{
    _text = _x#0;

    if (typeName _text isNotEqualTo "ARRAY") then
    {
        _text = [_text];
    };

    _textSubstituted = "";

    {
        _nextLine = switch (_x) do
        {
            case (MISSION_NAME):          { getMissionConfigValue ["onLoadName","Mission Name"] };
            case (MISSION_SUBTITLE):      { getMissionConfigValue ["onLoadMission","Mission Description"] };
            case (MISSION_AUTHOR):        { getMissionConfigValue ["author","Mission Maker"] };
            case (MISSION_DATE):          { format ["%4%5/%2%3/%1", date select 0, ["", "0"] select (date select 1 < 10), date select 1, ["", "0"] select (date select 2 < 10), date select 2] };
            case (MISSION_TIME):          { [dayTime, "HH:MM"] call BIS_fnc_timeToString };
            case (MISSION_LOCATION):      { (getPos player) call BIS_fnc_locationDescription };
            case (MISSION_DATE_AND_TIME): { format ["%4%5/%2%3/%1, %6", date select 0, ["", "0"] select (date select 1 < 10), date select 1, ["", "0"] select (date select 2 < 10), date select 2, [dayTime, "HH:MM"] call BIS_fnc_timeToString] };
            default {_x};
        };

        _textSubstituted = _textSubstituted + _nextLine;

    } forEach _text;

    _textOut = format ["<br/><t font='%2' size='%3'>%1</t>", _textSubstituted, _x#1, _x#2];

    systemChat str _textOut;

    _structuredTextLines pushBack (parseText _textOut);

} forEach _textArray;

_titleText = composeText _structuredTextLines;


// Uncomment and modify to add music if desired
if (f_var_missionIntro_shouldChoreograph) then
{
    playMusic f_var_missionIntro_choreographWith;
    uiSleep f_var_missionIntro_choreographDelay;

};


[_titleText, [0.6,0.8,1.5,1], nil, f_var_missionIntro_duration, f_var_missionIntro_fadeInTime, 0] call BIS_fnc_textTiles;
