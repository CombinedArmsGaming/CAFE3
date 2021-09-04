#include "../macros.hpp"

CLIENT_ONLY;

params ["_position", "_object", ["_side", west]];

if (isNull _object) then
{
    ["No object found: respawner object unchanged."] call zen_common_fnc_showMessage;
}
else
{
    _sideStr = str _side;
    _objectName = toLower ("respawner_" + _sideStr);

    missionNamespace setVariable [_objectName, _object, true];
    ["Set %1 respawner object to '%2'.", _sideStr, typeOf _object] call zen_common_fnc_showMessage;

};
