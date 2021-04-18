/*

    Advanced mission intro.
    By Gibbs and Bubbus

    Allows you to create mission intro text which you can show to the user with a Zeus module.
    You can choose a preset option, or use customised text.
    You can also choose to choreograph the text with some music, choosing the exact time in the song that the text will appear.

*/


// Show the 'classic' place-and-time display to players when they start the mission.
// This will appear in the middle-right of the screen.
f_var_showClassicIntroAtStart = true;


/*
    Set the type of mission intro to use.

    Choose from:
        MISSIONINTRO_DEFAULT - Takes the mission name and subtitle from the description.ext file.
        MISSIONINTRO_FULL - Like MISSIONINTRO_DEFAULT, but also shows the author name along with the date and time.
        MISSIONINTRO_CUSTOM
*/
f_var_missionIntro_type = MISSIONINTRO_FULL;

// Amount of time that the intro should stay on-screen.
f_var_missionIntro_duration = 15;

// Amount of time it takes for the intro to fade in and fade back out.
f_var_missionIntro_fadeInTime = 3;


/*
    If you have chosen MISSIONINTRO_CUSTOM, use the array below to customise your intro.

    Each line follows this format:
        ["Text to show", "Font to use", Size of font]

    You can choose any of the fonts in this wiki page:
        https://community.bistudio.com/wiki/FXY_File_Format#Available_Fonts

    Instead of text, you can use one of these special values on any of the lines:
        MISSION_NAME, MISSION_SUBTITLE, MISSION_AUTHOR, MISSION_DATE, MISSION_TIME, MISSION_DATE_AND_TIME

    Finally, avoid using angle brackets ('<' and '>') or back-slashes ('\').
*/
f_arr_missionIntroLines =
[
    [MISSION_NAME, "PuristaBold", 2],
    [MISSION_SUBTITLE, "PuristaBold", 1.3],
    [["Made by ", MISSION_AUTHOR], "PuristaBold", 1.2],
    ["Pretty cool huh", "RobotoCondensed", 1]
];


// If you want to time your intro with some music, set this to true.
f_var_missionIntro_shouldChoreograph = false;

// Choose the music to play with your intro.  It should be put into the CfgMusic section of the description.ext file.
f_var_missionIntro_choreographWith = "MyMusic";

// Choose how many seconds to wait into the music before showing the intro text.
f_var_missionIntro_choreographDelay = 0;
