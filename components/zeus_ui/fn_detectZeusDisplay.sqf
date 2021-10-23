/* --------------------------------------------------------------------------------------------------------------------
	Author:		Cre8or + Bubbus
	Description:
		Continuously checks if the Zeus interface is open, and if so, initialises the Zeus UI.
	Arguments:
		(nothing)
	Returns:
		(nothing)
-------------------------------------------------------------------------------------------------------------------- */

#include "macros.hpp"
#include "config\macros.hpp"


CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_zeusDeployment);


// Wait for the mission to start and for the units list to be compiled
waitUntil 
{
	time > 0 && missionNamespace getVariable [MACRO_VARNAME_UI_LISTSCOMPILED, false]
};


[] spawn
{
	disableSerialization;

	while {true} do
	{
		waitUntil
		{
			uiSleep 0.15;
			!isNull (findDisplay 312)
		};
		
		// Start the custom Zeus UI
		["ui_init"] call f_fnc_zeusUI;
		
		
		waitUntil
		{
			uiSleep 0.15;
			isNull (findDisplay 312)
		};
					
	};	
	
};


