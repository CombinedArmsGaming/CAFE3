params [["_pos", [], []]];

[_pos] spawn 
{
	params ["_pos2"];
	private _bomb = "Bo_GBU12_LGB" createVehicle _pos2;
	_bomb setDamage 1;
	_bomb setVelocity [0,0,-3000]
}
