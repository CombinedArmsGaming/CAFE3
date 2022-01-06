/*
CAFE3 Ending system
Author: Joecuronium
This file allows the missionmaker to define custom endings.

EXAMPLE:

class End1
{
	title = "Ending #1";	//Main title that shows up on ending
	subtitle = ""; 			//Smaller subtitle
	description = ""; 		//This only shows up in the small debriefing screen, dont put important info here
	//music = ""; 			//Uncomment this for the following options: "" for no ending music. Any CfgMusic string for custom ending music. Leaving this commented plays the standard music.
	//code = {}; 			//Uncommenting this allows you to put custom code in there that will be executed BEFORE the ending plays

	// pictureBackground = "";
	// picture = "";
	// pictureColor[] = {0.0,0.3,0.6,1};
};



*/

class End1
{
	title = "Ending #1";
	subtitle = "";
	description = "Please post to the AAR thread!";
	//music = ""; //Standard music will play
	//code = {};

	// pictureBackground = "";
	// picture = "";
	// pictureColor[] = {0.0,0.3,0.6,1};
};

class End2
{
	title = "Ending #2";
	subtitle = "";
	description = "Please post to the AAR thread!";
	music = ""; //No music will play
	//code = {};

	// pictureBackground = "";
	// picture = "";
	// pictureColor[] = {0.0,0.3,0.6,1};
};

class End3
{
	title = "Ending #3";
	subtitle = "";
	description = "Please post to the AAR thread!";
	//music = "";
	//code = {};

	// pictureBackground = "";
	// picture = "";
	// pictureColor[] = {0.0,0.3,0.6,1};
};

class MissionBroke
{
	title = "Mission Broke";
	subtitle = "";
	description = "Sorry!";
	music = "FourStringEnding";				//Music will play
	//code = "systemChat 'Mission Broke'";    // Code will run - should be a string.

	// pictureBackground = "";
	// picture = "";
	// pictureColor[] = {0.0,0.3,0.6,1};
};
