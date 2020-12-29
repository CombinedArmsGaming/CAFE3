#include "macros.hpp"

params ["_position", "_object", ["_side", west]];

if (isNull _object) then
{
    systemChat "No object found: respawner object unchanged.";
}
else
{
    _sideStr = str _side;
    _objectName = toLower ("respawner_" + _sideStr);

    missionNamespace setVariable [_objectName, _object, true];
    systemChat format ["Set %1 respawner object to '%2'.", _sideStr, typeOf _object];
    
};
