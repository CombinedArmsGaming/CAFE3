params ["_container"];


_allMedTypes = ["ACE_atropine", "ACE_adenosine", "ACE_morphine", "ACE_epinephrine"];
_totalMeds = 0;
_medIndices = [];
_medEntries = [];

{

    if (typeName _x == "ARRAY" and {count _x == 2 and {_x select 0 in _allMedTypes}}) then
    {
        _totalMeds = _totalMeds + (_x select 1);
        _medIndices pushBack _forEachIndex;
    };

} forEach _container;


if (_totalMeds <= 0) exitWith {};


_medCount = _totalMeds * (2 / 5);

_medEntries pushBack ["ACE_morphine", floor _medCount];
_medEntries pushBack ["ACE_epinephrine", ceil _medCount];

_remainingCount = _totalMeds - (floor _medCount + ceil _medCount);

_medEntries pushBack ["ACE_atropine", floor _remainingCount];


reverse _medIndices;


{
    _container deleteAt _x;

} forEach _medIndices;


_container append _medEntries;


_container
