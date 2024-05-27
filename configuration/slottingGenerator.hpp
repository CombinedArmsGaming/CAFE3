/*
	Slotting generator configuration.

	HOW TO USE:

	Marking groups:
		To mark groups as being related to eachother, use the editor's "Sync To" feature to link the leaders of each group together.
		After doing this, you should see blue lines connecting all the leaders in your player hierarchy together.  This will also be visible in Zeus.
		You must mark the overall commander with a line of code in their 'Init' box in the editor.  Use the following:

			this setVariable ["f_leaderGroup", true];

		You can do this multiple times for commanders of different sides.
		You can also have groups that are split-off from the main hierarchy - if you mark them in the same way as above, then they will appear separately in the slotting page.

	Marking players:
		You can mark players with special attributes that will show up on the slotting page - you do this by pasting lines of code into their 'Init' box in the editor.

		To mark a player as a raffled slot, use this code:
			this setVariable ["f_slot_raffle", true];

		To mark a player as a locked slot, use this code:
			this setVariable ["f_slot_locked", true];

	Generating the slotting code:
		Un-comment the '#define' line below.  After that, press CTRL+S to save the mission.
		This will enable a "slotting generator mode" that MUST BE DISABLED AGAIN before uploading your mission to the server.

		At this point, use the "Play in Multiplayer (MP)" feature in the editor.  If "slotting generator mode" is enabled, then all of the player slots should be taken by AI.

		Go into Zeus, and find the "Generate Slotting Code" Zeus module.  This module is only available in "slotting generator mode".
		Use this module, and a full slotting code should be copied to your clipboard.  You can then paste it anywhere outside of the game with CTRL+V.

		The code may still need some changes - for example, a link to a Google doc, the proper running date etc.

	FAQ:
		"My slotting short-codes are wrong!"
		- Go to the 'components\slottingGenerator\globals.sqf' file, and find the 'f_map_slot_shortcodes' list at the top of the file.
		  This is a lookup-list between the name of your slot (the 'Role Description' box in the editor) and the short-code that it translates into.
		  You can add new lines to this list - each time you do, you'll need to restart the mission for the new lines to work.
		  If you need to do this, let us know in the #missionmaking channel so we can add it into future versions of CAFE!

		"My slotting icons are wrong!"
		- This is similar to the short-codes.  Instead, look for the 'f_map_slot_icons' list.
		  This is a lookup-list between the short-code of your slot and the icon that it translates into.
		  You can add new lines to this list - each time you do, you'll need to restart the mission for the new lines to work.
		  If you need to do this, let us know in the #missionmaking channel so we can add it into future versions of CAFE!

		"How do I mark a slot as restricted?!"
		- This is similar to the icons.  Instead, look for the 'f_map_slot_restricted' list.
		  This is a lookup-list between the short-code of your slot and whether it is restricted.
		  You can add new lines to this list - each time you do, you'll need to restart the mission for the new lines to work.
		  If you need to do this, let us know in the #missionmaking channel so we can add it into future versions of CAFE!
*/

// Enable "slotting generator mode".
// To disable "slotting generator mode", comment-out or delete the line below.

// #define ENABLE_SLOTTING_GENERATOR_MODE
