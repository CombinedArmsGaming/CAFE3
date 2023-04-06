// ACRE integration for CAFE, by Bubbus
// Handler for CA_PreGearscriptUnit_Local event - forces loadout to have the radios prescribed by the radio config.
// Attempts to put the radios in the vest or backpack based on the radio type.
// Forces the unit to have a backpack if given a backpack radio, or if naked.  Attempts to place vest radios wherever there is space.


params ["_typeOfUnit", "_unit", "_faction", "_loadout", "_extendedArray"];

[_loadout] call f_fnc_acre_removeRadiosFromLoadout;

private _groupName = groupId group _unit;
private _side = side group _unit;

private _radiosForUnit = [_side, _typeOfUnit, _groupName] call f_fnc_acre_getRadiosForRoleInGroup;
if (count _radiosForUnit <= 0) exitWith {};

private _unitGetsBackpackRadio = (_radiosForUnit findIf {(_x#0) in f_arr_acre_backpackRadios}) >= 0;

private _uniform = _loadout # 3;
private _vest = _loadout # 4;
private _backpack = _loadout # 5;

private _allClothes = [_uniform, _vest, _backpack];

if ((_backpack isEqualTo [] and _unitGetsBackpackRadio) or {_allClothes isEqualTo [[],[],[]]}) then
{
    _backpack pushBack "B_AssaultPack_rgr";
    _backpack pushBack [];
};

if (_vest isEqualTo []) then
{
    _vest = _allClothes # (_allClothes findIf {_x isNotEqualTo []});
};

{
    if (_x in f_arr_acre_backpackRadios) then
    {
        (_backpack#1) pushBack [_x#0, 1];
    }
    else
    {
        (_vest#1) pushBack [_x#0, 1];
    };
}
foreach _radiosForUnit;

private _radioNetOverrides = _radiosForUnit select {count _x >= 3};
_radioNetOverrides = _radioNetOverrides apply {[_x#0, _x#2]};

[_unit, _radioNetOverrides] call f_fnc_acre_configureRadioPresets;