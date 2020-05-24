// CA - Filling listbox for the ca marker management system.

disableSerialization;
_display = findDisplay 1995;

_lb1ctrl = _display displayCtrl 1500;
_lb2ctrl = _display displayCtrl 1501;

_edctrl = _display displayCtrl 1400;
//_edctrl ctrlSetText (format ["%1",(groupid group player)]);

_colorarray = ['Red','Orange','Yellow','Green','Blue','Cyan','Magenta','Pink','Purple','White','Light Grey','Dark Grey','Black','Grey','Brown','Khaki'];
_typearray = ['Helicopter','Anti-air','Armor','Artillery','HQ','Infantry','Repair','Mechanized Inf.','Medic','Mortar','Motorized Inf.','Naval','Plane','Recon','Supply','Unknown'];

{_lb1ctrl lbAdd _x; _lb1ctrl lbSetData [_forEachIndex, _x];} forEach _colorarray;
{_lb2ctrl lbAdd _x; _lb2ctrl lbSetData [_forEachIndex, _x];} forEach _typearray;

/*
_MkrColor = (group player) getVariable ["ca_groupcolor","ColorBlack"];
_MkrType = (group player) getVariable ["ca_grouptype","b_hq"];

{
    if (_MkrColor == _x) then {
        _lb1ctrl lbSetCurSel _forEachIndex;
    };
} forEach _colorarray;
{
    if (_MkrType == _x) then {
        _lb2ctrl lbSetCurSel _forEachIndex;
    };
} forEach _typearray;
*/
