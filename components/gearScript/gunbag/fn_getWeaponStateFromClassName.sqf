// Derived from ace_common_fnc_getWeaponState.  Used to get a 'getWeaponState' array from a weapon config string.
// Augments the standard 'getWeaponState' array by returning the base weapon name as a 5th field.
// Currently ignores configured default magazines.  Arrays returned from this function will have no ammo.

params [["_weapon", nil, [""]]];
if (isNil "_weapon") throw "_weapon must not be nil.";

private _weaponClass = configFile >> "CfgWeapons" >> _weapon;
if (isNil "_weapon") throw "_weapon must be a subclass of CfgWeapons.";

private _baseWeapon = getText (_weaponClass >> "baseWeapon");

private _attachments = ["","","",""];
private _linkedItems = _weaponClass >> "LinkedItems";
private _linkedItemsSubclasses = _linkedItems call BIS_fnc_getCfgSubClasses;

{
	private _entry = _linkedItems >> _x;
	private _index = f_arr_gunbagAttachmentsMap get _x;

	if !(isNil "_index") then
	{
		private _attachmentName = getText (_entry >> "item");
		_attachments set [_index, _attachmentName];
	};
} foreach _linkedItemsSubclasses;

private _muzzles = _weapon call ace_common_fnc_getWeaponMuzzles;
private _magazines = _muzzles apply {""};
private _ammo = _muzzles apply {0};

[_attachments, _muzzles, _magazines, _ammo, _baseWeapon];