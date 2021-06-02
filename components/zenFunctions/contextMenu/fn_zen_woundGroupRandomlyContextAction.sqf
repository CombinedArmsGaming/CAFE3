#include "macros.hpp"

private _action = 
[
	"WoundGroupRandomly",
	"Wound Group Randomly",
	["",[1,1,1,1]],
	{
	_group = group _hoveredEntity;
	{
		[_x] remoteExec ["f_fnc_zen_doWoundUnitRandomly", 2];
	} foreach units _group;
	},
	{
		typeOf _hoveredEntity isKindOf "Man";
	}
] call zen_context_menu_fnc_createAction;

[_action, ["[CA2] Misc"], 0] call zen_context_menu_fnc_addAction;