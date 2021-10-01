#include "../macros.hpp"

CLIENT_ONLY;

params ["_position", ["_side", west]];

_sideStr = str _side;
_markerName = toLower ("respawn_" + _sideStr);

if (getMarkerColor _markerName isEqualTo "") then
{
    _marker = createMarker [_markerName, _position];
    _marker setMarkerAlpha 0;

    ["Created marker '%1' at given position.", _markerName] call zen_common_fnc_showMessage;
}
else
{
    _markerName setMarkerPos _position;
    ["Moved marker '%1' to given position.", _markerName] call zen_common_fnc_showMessage;
};
