#include "macros.hpp"


#ifdef ENABLE_GRAVESTONE_CORPSE_MANAGER


if (isServer) then
{
    DEBUG_PRINT_LOG("initting gravestones")

    _gravestoneType = "Box_Syndicate_Ammo_F";

	[] spawn f_fnc_initGravestoneManager;

    if (!isNil "gravestone" and {typeName gravestone == "OBJECT"}) then
    {
        if ([gravestone] call f_fnc_isContainer) then
        {
            _gravestoneType = typeOf gravestone;
        };

        deleteVehicle gravestone;
    };

    missionNamespace setVariable ["f_var_gravestoneTypeName", _gravestoneType, true];

};


if (hasInterface) then
{
    _actionParams =
    [
        "ReadGravestone",
        "Read Gravestone",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa",
        f_fnc_readGravestone,
        {true},
        {},
        [],
        "",
        3,
        [false,false,false,false,false],
        {}
    ];

    f_var_readGravestoneAction = _actionParams call ace_interact_menu_fnc_createAction;


    _actionParams =
    [
        "DeleteGravestone",
        "Remove Gravestone",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\destroy_ca.paa",
        f_fnc_deleteGravestone,
        {true},
        {},
        [],
        "",
        3,
        [false,false,false,false,false],
        {}
    ];

    f_var_deleteGravestoneAction = _actionParams call ace_interact_menu_fnc_createAction;

};


#include "..\..\startup\configuration\internals\obituaries.sqf";


#else

if (true) exitWith { DEBUG_PRINT_LOG("[Gravestones] init_component was called but ENABLE_GRAVESTONE_CORPSE_MANAGER is not set.") };

#endif
