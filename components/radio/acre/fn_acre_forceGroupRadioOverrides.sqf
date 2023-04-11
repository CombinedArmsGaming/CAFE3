// ACRE integration for CAFE, by Bubbus

[] call f_fnc_acre_setGroupRadioOverrides;

{
	if (isPlayer _x) then
	{
		[] remoteExecCall ["f_fnc_acre_resetPlayerRadioConfig", _x];
	};
}
forEach units group player;