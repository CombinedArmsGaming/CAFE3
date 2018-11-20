#include "..\macros.hpp"

params ["_container"];


_allBandageTypes = ["ACE_elasticBandage", "ACE_packingBandage", "ACE_fieldDressing", "ACE_tourniquet"];
_totalMeds = 0;
_medIndices = [];
_medEntries = [];

{

    if (typeName _x == "ARRAY" and {count _x == 2 and {_x select 0 in _allBandageTypes}}) then
    {
        _totalMeds = _totalMeds + (_x select 1);
        _medIndices pushBack _forEachIndex;
    };

} forEach _container;


if (_totalMeds <= 0) exitWith {};


_bandageCount = _totalMeds * (2 / 5);

_medEntries pushBack ["ACE_elasticBandage", floor _bandageCount];
_medEntries pushBack ["ACE_packingBandage", ceil _bandageCount];

DEBUG_FORMAT2_LOG("Adding %1 EBs and %2 PBs",floor _bandageCount,ceil _bandageCount)

_remainingCount = _totalMeds - (floor _bandageCount + ceil _bandageCount);

_medEntries pushBack ["ACE_fieldDressing", floor (_remainingCount / 2)];
_medEntries pushBack ["ACE_tourniquet", ceil (_remainingCount / 2)];

DEBUG_FORMAT2_LOG("Adding %1 FDs and %2 TQs",floor (_remainingCount / 2),ceil (_remainingCount / 2))


reverse _medIndices;


{
    _container deleteAt _x;

} forEach _medIndices;


_container append _medEntries;


_container
