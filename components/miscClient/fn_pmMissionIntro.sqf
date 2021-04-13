#include "macros.hpp"

RUN_ON_SERVER(f_fnc_pmMissionIntro,_this);
RUN_AS_ASYNC(f_fnc_pmMissionIntro);

sleep 3;

// Uncomment and modify to add music if desired
//["DF2Music01", 0, .6] remoteExec ["BIS_fnc_playMusic"];

// Uncomment and modify to time titles to music for cool points
//uisleep 7.3;


// MISSION TITLES CONFIG

// The following lines control what text will appear in the bottom right of the screen after the mission starts.
// You can edit existing lines in the [CONFIG_FILE_NAME] file.

{

    // I'm sure there's an easy way to get the mission name, but for now this. Shame me when you see it, ty.
    _missionName = "Operation Framework";

    _line1 = parseText format ["<br/><t font='PuristaBold' size='1.8'>%1</t>", _missionName];
    _line2 = parseText format ["<br/><t font='PuristaBold' size='1.4'>%1</t>", (getPos player) call BIS_fnc_locationDescription];
    _line3 = parseText format ["<br/><t size='1'>%1/%2/%3</t>", (date select 0), (date select 1), (date select 2)];
    _line4 = parseText format ["<br/><t size='1'>%1</t>", ([dayTime, "HH:MM"] call BIS_fnc_timeToString)];

    _titleText = composeText [_line1, _line2, _line3, _line4];

    [_titleText, true, nil, 7.5, 1, 0] call BIS_fnc_textTiles;
}
 remoteExec ["bis_fnc_call"];