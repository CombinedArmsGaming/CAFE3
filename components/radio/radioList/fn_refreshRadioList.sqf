params ["_titleBar", "_radiosTable", "_yourRadiosTable", ["_playerSide", ""], ["_radioList", []], ["_yourRadioList", []]];

disableSerialization;

if (_playerSide isEqualTo "") then { _playerSide = side group player };

_radioMod = [] call f_fnc_getRadioModInUse;
_titleBar ctrlSetText format [" %1: Radio list for %2", _radioMod, toUpper ([_playerSide] call f_fnc_sidetoString)];
_titleBar ctrlCommit 0;

if (_radioList isEqualTo []) then { _radioList = [_playerSide] call f_fnc_getRadioList };

tvClear _radiosTable;

{
    private _netIndex = _forEachIndex;
    _radiosTable tvAdd [[], _x#0];

    {
        _radiosTable tvAdd [[_netIndex], format ["%1: %2", _forEachIndex + 1, _x]];
    } foreach (_x#1);

} foreach _radioList;

tvExpandAll _radiosTable;


if (_yourRadioList isEqualTo []) then { _yourRadioList = [player] call f_fnc_getRadioChannelsForUnit };

if (["acre_sys_radio"] call ace_common_fnc_isModLoaded) then 
{
    _yourRadioList = _yourRadioList apply 
    {
        [getText (configFile >> "CfgAcreComponents" >> (_x#0) >> "name"), _x#1]
    };   
};

tvClear _yourRadiosTable;

_yourRadiosTable tvAdd [[], "Your assigned channels:"];
{
    _yourRadiosTable tvAdd [[0], format ["%1: %2", _x#0, _x#1]];
} foreach _yourRadioList;

tvExpandAll _yourRadiosTable;