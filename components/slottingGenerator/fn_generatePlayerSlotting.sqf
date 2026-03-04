params ["_unit"];

private _roleName = (roleDescription _unit) regexReplace ["@.+", ""];


private _rifle = primaryWeapon _unit;
private _handgun = handgunWeapon _unit;
private _launcher = secondaryWeapon _unit;

private _weaponsToList = [];

if (_rifle == "") then
{
	if (_handgun != "") then {_weaponsToList pushBack _handgun};
	if (_launcher != "") then {_weaponsToList pushBack _launcher};
}
else
{
	_weaponsToList pushBack _rifle;
	if (_launcher != "") then {_weaponsToList pushBack _launcher};
};

private _weaponsReadable = _weaponsToList apply 
{
	private _configNode = configFile >> "CfgWeapons" >> _x;
	
	if !(isNull _configNode) then {getText (_configNode >> "displayName")}
	else {_x}
};

private _weaponsString = _weaponsReadable joinString " + ";

private _allDLCs = [_unit] call f_fnc_discoverAllUnitDLCs;

private _roleShortcode = f_map_slot_shortcodes getOrDefault [toLower _roleName, _roleName];
private _isRestricted = f_map_slot_restricted getOrDefault [_roleShortcode, false];
private _roleIcon = f_map_slot_icons getOrDefault [_roleShortcode, "MAN"];
private _isLocked = _unit getVariable ["f_slot_locked", false];
private _isRaffle = _unit getVariable ["f_slot_raffle", false];

[
	["slot_name", _roleName],
	["slot_player", 
		[
			["player_id", ""],
			["player_name", ""]
		]
	],
	["slot_shortcode", _roleShortcode],
	["slot_gear", _weaponsString],
	["slot_restricted", _isRestricted],
	["slot_locked", _isLocked],
	["slot_icon_code", _roleIcon],
	["slot_dlc", _allDLCs],
	["raffle_winner", 
		[
			["player_id", ""],
			["player_name", ""]
		]
	],
	["slot_raffle", _isRaffle],
	["raffle_entrants", []]
]