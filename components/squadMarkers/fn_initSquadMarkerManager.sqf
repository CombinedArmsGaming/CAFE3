
#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_initSquadMarkerManager);

f_arr_squadMarkers = [];

waitUntil
{
    if !(alive player) exitWith {};

    _newMarkers = [];

    _playerSide = side player;
    _sideGroups = allGroups select {side _x == _playerSide};

    _sideName = [_playerSide] call f_fnc_sideToString;

    {
        _units = units _x;

        if !(isNull _x or {count _units <= 0}) then
    	{
            _name = groupId _x;

            _icon = "";
            _colour = [];
            _visible = true;

            _entry = SQUAD_VAR_DYNAMIC(_name,_sideName);

            if !(_entry isEqualTo []) then
            {
                _visible = SQUAD_VISIBLE(_entry);

                if (_visible) then
                {
                    if !(SQUAD_NAME(_entry) isEqualTo "") then {_name = SQUAD_NAME(_entry)};
                    if !(SQUAD_ICON(_entry) isEqualTo "") then {_icon = SQUAD_ICON(_entry)};
                    if !(SQUAD_COLOUR(_entry) isEqualTo []) then {_colour = SQUAD_COLOUR(_entry)};

                };

            };

            if (_visible) then
            {
                if (_icon isEqualTo "") then {_icon = [_x] call f_fnc_getGroupMarker};
                if (_colour isEqualTo []) then {_colour = DEFAULT_COLOUR};

                if (_name == groupId _x) then
                {
                    _isAiOnly = ({isPlayer _x} count _units) <= 0;
                    if (_isAiOnly) then {_name = "Friendly forces"};
                };

                _newMarkers pushBack [_x, _icon, _name, _colour];

            };

        };

    } forEach _sideGroups;


    f_arr_squadMarkers = _newMarkers;

    sleep 1;
};
