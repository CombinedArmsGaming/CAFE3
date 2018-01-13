params ["_bomb"];

_onBombDefuse = 
{
	params ["_bomb", "_caller", "_actionId"];

	[_bomb, ["defused", true]] remoteExec ["setVariable", 2];
	
	[_bomb, _actionId] remoteExec ["removeAction", 0];
	
	[[], "bub\bub_vm_cl_showDefuseText.sqf"] remoteExec ["execVM", _caller];
	
	
	_bombName = _bomb getVariable ["bomb_name", ""];
	_bombText = "Defused a nuke!";
	
	if (_bombName != "") then 
	{
		_bombText = format ["Defused the nuke in %1.", _bombName];
	};
	
	["TaskSucceeded",["",_bombText]] remoteExec ["BIS_fnc_showNotification", west];
	
};


if (isServer) then
{
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
};

		