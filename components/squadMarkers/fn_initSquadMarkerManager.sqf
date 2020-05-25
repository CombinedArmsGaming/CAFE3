
#include "macros.hpp"

CLIENT_ONLY;
RUN_AS_ASYNC(f_fnc_initSquadMarkerManager);

f_arr_squadMarkers = [];
f_arr_unitMarkers = [];

waitUntil
{
    if !(alive player) exitWith {false};

    _newMarkers = [];
    _newUnitMarkers = [];

    _playerSide = side group player;
    _sideGroups = allGroups select {side _x == _playerSide};

    _sideName = [_playerSide] call f_fnc_sideToString;

    {
        _group = _x;
        _units = units _group;

        if !(isNull _group or {{alive _x} count _units <= 0}) then
    	{
            _name = groupId _group;

            _icon = "";
            _colour = [];
            _visible = true;
            _specials = [];

            if !(isNull _group) then
            {
                _visible = SQUAD_VISIBLE(_group);

                if (_visible) then
                {
                    if !(SQUAD_ICON(_group) isEqualTo "") then {_icon = SQUAD_ICON(_group)};
                    if !(SQUAD_COLOUR(_group) isEqualTo []) then {_colour = SQUAD_COLOUR(_group)};
                    // 2020-05-21 TODO :: Redo special markers as class-specific markers.
                    _specials = []; //SQUAD_SPECIALS(_group);

                };

            };

            if (_visible) then
            {
                _isAiOnly = ({isPlayer _x} count _units) <= 0;

#ifdef SHOW_NPC_SQUADS
                _shouldShow = true;
#endif
#ifndef SHOW_NPC_SQUADS
                _shouldShow = !_isAiOnly;
#endif

                if (_shouldShow) then
                {
                    if (_isAiOnly) then
                    {
                        if !(SQUAD_IS_IMPORTANT(_group)) then
                        {
                            _name = "Allies";
                            _colour = LIGHTGREY;
                        };

                    };

                    if (_icon isEqualTo "") then {_icon = [_group] call f_fnc_getGroupMarker};
                    if (_colour isEqualTo []) then {_colour = DEFAULT_COLOUR};

                    _newMarkers pushBack [_group, _icon, _name, _colour];

                };

            };


            _specials = SQUAD_SPECIALISTS(_group);

            {
                [_group, _newUnitMarkers, _x, (toUpper _x)] call f_fnc_addGroupMemberMarkers;
            } forEach _specials;

        };

    } forEach _sideGroups;


    f_arr_squadMarkers = _newMarkers;
    f_arr_unitMarkers = _newUnitMarkers;

    sleep 1;
	false

};
