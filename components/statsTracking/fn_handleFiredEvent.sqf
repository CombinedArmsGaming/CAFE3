// Handles adding to the player's stats 
// The second and third parameters are used to verify (if possible) that the player this is called for 
// is in fact the local player. Set to false, nil if you don't want to/can't do that check. 
params ["_magazine", "_verifyIsPlayer", "_unit"];

if (_verifyIsPlayer) then {
	if !(_unit isEqualTo player) exitWith {};
};

private _magName = getText (configFile >> "CfgMagazines" >> _magazine >> "displayName");
private _currentCount = cafe_playerShots getOrDefault [_magName, 0];
private _updated = _currentCount + 1;
cafe_playerShots set [_magName, _updated];