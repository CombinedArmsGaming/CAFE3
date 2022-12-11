// Override of ace_gunbag_fnc_hasGunbag, to allow any backpack to be a gunbag if it has the gunbag variable set.

params ["_unit"];

(getNumber (configFile >> "CfgVehicles" >> (backpack _unit) >> "ace_gunbag") == 1) or
{
	((backpackContainer _unit) getVariable ["ace_gunbag_gunbagWeapon", []]) isNotEqualTo []
}