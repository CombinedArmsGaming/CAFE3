params ["_container"];

if (count _container < 2) exitWith {};

_contents = _container#1;
_newContents = [];

{
    _isAcre = (_x#0 select [0,4]) isEqualTo "ACRE";
    _isRadio = (_x#0 select [0,9]) isEqualTo "ItemRadio";

    if !(_isAcre or _isRadio) then {_newContents pushBack _x};

} forEach _contents;

_container set [1, _newContents];
