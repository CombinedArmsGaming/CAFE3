params [["_oldGroup", grpNull]];

if ((_oldGroup isEqualTo grpNull) or {!(_oldGroup isEqualType grpNull)}) then
{
	_oldGroup = group player;
};

diag_log format ["[CAFE Respawn]: Storing old group for player %1: %2", player, _groupName];

f_var_lastPlayerGroupName = groupId _oldGroup;