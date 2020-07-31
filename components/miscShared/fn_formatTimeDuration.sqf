
params ["_time"];

_timeString = "";

if (_time > (60*60)) then
{
    _timeString = format ["%1h %2m %3s", floor (_time / (60*60)), floor ((_time / 60) mod 60), floor (_time mod 60)];
};
if ((_timeString isEqualTo "") and {_time > 60}) then
{
    _timeString = format ["%1m %2s", floor ((_time / 60) mod 60), floor (_time mod 60)];
}
else
{
    _timeString = format ["%1s", floor _time];
};

_timeString
