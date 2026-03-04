params ["_unit", "_maxLoads"];

if (_maxLoads isEqualTo [0,0,0]) exitWith {};

private _uniformLoad = _maxLoads#0;
private _vestLoad = _maxLoads#1;
private _backpackLoad = _maxLoads#2;

if (_uniformLoad > 0) then
{
    (uniformContainer _unit) setMaxLoad _uniformLoad;
};

if (_vestLoad > 0) then
{
    (vestContainer _unit) setMaxLoad _vestLoad;
};

if (_backpackLoad > 0) then
{
    (backpackContainer _unit) setMaxLoad _backpackLoad;
};