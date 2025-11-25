/*
	Initial Task State ZEN module by Kennedy, development into on-the-fly Task Framework management by outsidecontextcass

	Known limitations:
	- Tasks lack icons
	- Tasks lack destinations
	- Only tasks of the same side as Zeus are listed

	Features:
	When enabled, the [CAFE3 Tasking] category appears with the following modules:

	Create Tasking:
	Allows Zeus to create an Arma 3 Task Framework task on the fly. The Owner side defaults to WEST, and the initial state to Created.
	
	Set Tasking State:
	Allows Zeus to adjust the state of a task on the fly whether it's been created in Eden or as Zeus. The module uses the Task ID as a friendly name.

	Remove Tasking:
	Allows Zeus to delete a Task. May need running multiple times if a Task is synced to a specific group to first clear the assignment, then delete the Task itself.
*/

// Comment out to disable the CAFE3 Tasking modules
#define USE_ZEUS_TASKING_MODULES