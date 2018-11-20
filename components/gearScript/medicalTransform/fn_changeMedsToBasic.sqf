params ["_container"];


_medTypes = ["ACE_atropine", "ACE_adenosine"];
_totalMeds = 0;
_medIndices = [];
_medEntries = [];

{

    if (typeName _x == "ARRAY" and {count _x == 2 and {_x select 0 in _medTypes}}) then
    {
        _totalMeds = _totalMeds + (_x select 1);
        _medIndices pushBack _forEachIndex;
    };

} forEach _container;


if (_totalMeds <= 0) exitWith {};


_medEntries pushBack ["ACE_morphine", floor (_totalMeds / 2)];
_medEntries pushBack ["ACE_epinephrine", ceil (_totalMeds / 2)];


reverse _medIndices;


{
    _container deleteAt _x;

} forEach _medIndices;


_container append _medEntries;


_container
