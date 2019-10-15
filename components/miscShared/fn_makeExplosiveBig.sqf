params [["_item", objNull, [objNull]]];


private _killIdx = _item addEventHandler
[
	"Killed",
	{
		params ["_ied"];

		private _pos = (getPos _ied) vectorAdd [5,5,20];
		[_pos] call f_fnc_makeExplosion;
		_pos = (getPos _ied) vectorAdd [-5,-5,20];
		[_pos] call f_fnc_makeExplosion;

		private _handlerIdx = _ied getVariable "IED Killed Index";

		if (typename _handlerIdx == "SCALAR") then
		{
			_ied removeEventHandler ["Killed", _handlerIdx];
		};

		_ied setVariable ["IED Killed Index", null];

	}

];


_item setVariable ["IED Killed Index", _killIdx];


_item addEventHandler
[
	"HandleDamage",
	{
		params ["_ied", "_wasd", "_dmg"];
		if (_dmg > 0.01) then
		{
			_ied setDamage 1;
		}
	}

];
