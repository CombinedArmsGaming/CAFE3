#include "macros.hpp"

params ["_position", ["_side", west]];

_sideStr = str _side;
_markerName = toLower ("respawn_" + _sideStr);

if (getMarkerColor _markerName isEqualTo "") then
{
    _marker = createMarker [_markerName, _position];
    _marker setMarkerAlpha 0;

    systemChat format ["Created marker '%1' at given position.", _markerName];
}
else
{
    _markerName setMarkerPos _position;
    systemChat format ["Moved marker '%1' to given position.", _markerName];
};
