
params ["_unit", "_rating"];

_currentRating = rating _unit;
_ratingDiff = _rating - _currentRating;

_unit addRating _ratingDiff;
