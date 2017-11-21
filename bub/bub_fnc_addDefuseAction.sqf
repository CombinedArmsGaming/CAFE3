params ["_bomb"];


_onBombDefuse = 
{
	params ["_bomb", "_caller", "_actionId"];

	[_bomb, ["defused", true]] remoteExec ["setVariable", 2];
	
	[_bomb, _actionId] remoteExec ["removeAction", 0];
	
	[[], "bub\bub_vm_cl_showDefuseText.sqf"] remoteExec ["execVM", _caller];
	
};


[
	_bomb, 
	
	[
		"<t color='#FFFF88'>Defuse Bomb</t>", 
		_onBombDefuse,
		nil, 
		6, 
		true, 
		true, 
		"", 
		'"ACE_DefusalKit" in (items _this);', 
		2
	]
	
] remoteExec ["addAction", 0];


		