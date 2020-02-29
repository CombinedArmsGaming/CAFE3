#include "..\macros.hpp"

params ["_button"];

if (count DOWNTIME_CONTROL_SIDES <= 0) exitWith
{
    _button ctrlEnable false;
    _button ctrlSetTooltip "The missionmaker has disabled AI control while you're down.";
};

_sideNames = [];
_first = true;
_addN = false;

{
    switch (_x) do {
        case (west): {
            _sideNames pushBack "BLUFOR";
        };
        case (east): {
            _sideNames pushBack "OPFOR";
        };
        case (independent): {
            _sideNames pushBack "INDFOR";
            _addN = _addN or _first;
        };
        default {
            _sideNames pushBack (str _x);
        };
    };
} forEach DOWNTIME_CONTROL_SIDES;

_format1 = if (_addN) then {"n"} else {""};
_format2 = _sideNames joinString " or ";

_tooltip = _button ctrlSetTooltip format ["Control a%1 %2 unit until you're up again.", _format1, _format2];
