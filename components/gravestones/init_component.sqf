#include "macros.hpp"


#ifdef ENABLE_GRAVESTONES

if (isServer) then
{
    DEBUG_PRINT_LOG("initting gravestones")

    [] spawn f_fnc_initGravestoneManager;

};

if (hasInterface) then
{
    _onReadGrave =
    {
        _unitWithin = _target getVariable ["UnitWithin", "a forgotten soul"];
        systemChat format ["Grave %1 belongs to unit %2", _target, _unitWithin];
    };

    _actionParams =
    [
        "ReadGravestone",
        "Read Gravestone",
        "",
        _onReadGrave,
        {true},
        {},
        [],
        "",
        3,
        [false,false,false,false,false],
        {}
    ];

    f_var_gravestoneAction = _actionParams call ace_interact_menu_fnc_createAction;

};


#else

if (true) exitWith { DEBUG_PRINT_LOG("[Gravestones] init_component was called but ENABLE_GRAVESTONES is not set.") };

#endif
