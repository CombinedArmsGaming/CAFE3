
#include "macros.hpp"
RUN_AS_ASYNC(f_fnc_edenScaleSupport);

if (is3DEN) then
{
    f_fnc_edenTryToScale =
    {
        _name = (_this get3DENAttribute "name")#0;
        if ((_name find "scale") isNotEqualTo 0) exitWith { false };

        _nameParts = _name splitString "_";

        if (count _nameParts < 2) exitWith { false };

        _num = _nameParts#1;
        _num = (_num splitString "p" joinString ".");
        _parsedNum = parseNumber _num;

        if (_parsedNum <= 0) exitWith { false };

        _this setObjectScale _parsedNum;
        true

    };

    f_fnc_edenTryToAddScaleHandler =
    {
        if (_this getVariable ["f_scaleHander", -1] < 0) then
        {
            _eventId = _this addEventHandler ["AttributesChanged3DEN", f_fnc_edenScaleAttributeHandler];
            _this setVariable ["f_scaleHander", _eventId];

        };

    };

    f_fnc_edenScaleAttributeHandler =
    {
        (_this#0) call f_fnc_edenTryToScale;
    };

    _onSelectChangedHandler =
    {
        _selectedObjs = get3DENSelected "Object";

        {
            _x call f_fnc_edenTryToScale;
            _x call f_fnc_edenTryToAddScaleHandler;
        } forEach _selectedObjs;

    };

    _objs = all3DENEntities#0;

    {
        _couldScale = _x call f_fnc_edenTryToScale;
        if (_couldScale) then { _x call f_fnc_edenTryToAddScaleHandler; };

    } forEach _objs;

    add3DENEventHandler ["OnSelectionChange", _onSelectChangedHandler];

}
else
{
    waitUntil {sleep 1; time > 0};

    f_var_scaleAnchor = if EXISTS(f_var_scaleAnchor) then
    {
        f_var_scaleAnchor
    }
    else
    {
        "BlockConcrete_F" createVehicle [0,0,0]
    };

    _objectVars = missionNamespace call f_fnc_getAllObjectVariablesInNamespace;
    f_arr_scaleEntities = [];

    {
        (missionNamespace getVariable _x) call f_fnc_inGameScaleSupport;

    } forEach _objectVars;

    {
        _obj = (_x#0);

        if ((isNull attachedTo _obj) and {!isSimpleObject _obj}) then
        {
            [_obj, f_var_scaleAnchor] call BIS_fnc_attachToRelative;
        };

        _obj setObjectScale (_x#1);

    } forEach f_arr_scaleEntities;

};
