#include "../macros.hpp"

CLIENT_ONLY;

params ["_unit"];

if (isNull _unit) then
{
    ["No unit found to wound."] call zen_common_fnc_showMessage;
}
else
{
	_group = group _unit;
	["Wound Group Randomly",
	[
		["SLIDER", "Max Number of Wounds", [1, 20, 6, 0]],
		["COMBO", "Wound Types", [[["bullet", "grenade", "explosive", "shell", "vehiclecrash", "collision", "backblast", "stab", "punch", "falling", "ropeburn", "drowning"], ["bullet"], ["grenade"], ["explosive"], ["shell"], ["vehiclecrash"], ["collision"], ["backblast"], ["stab"], ["punch"], ["falling"], ["ropeburn"], ["drowning"]], ["All", "Bullet", "Grenade", "Explosive", "Shell", "Vehicle Crash", "Collision", "Backblast", "Stab", "Punch", "Fall", "Rope Burn", "Drowning"],0]],
		["COMBO", "Wound Locations", [[["head", "body", "leftArm", "rightArm", "leftLeg", "rightLeg"],["head"], ["body"], ["leftArm"], ["rightArm"], ["leftLeg"], ["rightLeg"]], ["All", "Head", "Body", "Left Arm", "Right Arm", "Left Leg", "Right Leg"], 0]]
		// ["SLIDER:PERCENT", "Wound Damage Range", [0, 1, 0.5, 2]]
	],
	{
		params ["_dialogValues", "_args"];
		_dialogValues params ["_maxWounds", "_forceWoundTypes", "_forceWoundLocations", "_damageRange"];
		_args params ["_group"];
		{
			[_x, _maxWounds, _forceWoundTypes, _forceWoundLocations, _damageRange] remoteExec ["f_fnc_woundUnitRandomly", 2];
		} foreach units _group;

	},
	{},
	[_group]] call zen_dialog_fnc_create;
};
