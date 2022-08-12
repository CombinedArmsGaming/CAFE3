#include "macros.hpp"

// Convenience function to abstract away target unless needed, and also maintain respawn registry.
// Also allows definition of "isCreatedWhen" and "isRemovedWhen" poll functions.  These control when the respawn point is created/deleted.
// "isRepeatable" allows "isCreatedWhen" to be re-used after "isRemovedWhen" is triggered.  This allows a respawn point to disappear temporarily for user-specified reasons.

SERVER_ONLY;

params 
[
	["_location", nil], 
	["_name", nil, [""]], 
	["_target", missionNamespace], 
	["_isCreatedWhen", nil, [{}]], 
	["_isRemovedWhen", nil, [{}]], 
	["_isRepeatable", false, [false]]
];

if !((isNil "_isCreatedWhen") or (isNil "_isRemovedWhen")) then
{
	private _pollerArray = [_isCreatedWhen, _isRemovedWhen, _isRepeatable];
	[[_target, _location, _name], _pollerArray] call f_fnc_addToRespawnPollers;
}
else
{
	[_target, _location, _name] call BIS_fnc_addRespawnPosition;
};