#include "macros.hpp"


#ifdef ENABLE_GRAVESTONE_CORPSE_MANAGER


_setGravestoneType =
{
    params ["_objectName", "_outputName"];

    _gravestoneType = "Box_Syndicate_Ammo_F";

    _gravestone = missionNamespace getVariable [_objectName, ""];

    if (typeName _gravestone == "OBJECT") then
    {
        if ([_gravestone] call f_fnc_isContainer) then
        {
            _gravestoneType = typeOf _gravestone;
        };

        deleteVehicle _gravestone;
    };

    missionNamespace setVariable [_outputName, _gravestoneType, true];
};

if (isServer) then
{
    DEBUG_PRINT_LOG("initting gravestones")

	[] spawn f_fnc_initGravestoneManager;

    ["gravestone",          "f_var_gravestoneTypeName"]          call _setGravestoneType;
    ["gravestone_blufor",   "f_var_gravestoneTypeName_blufor"]   call _setGravestoneType;
    ["gravestone_opfor",    "f_var_gravestoneTypeName_opfor"]    call _setGravestoneType;
    ["gravestone_indfor",   "f_var_gravestoneTypeName_indfor"]   call _setGravestoneType;
    ["gravestone_civilian", "f_var_gravestoneTypeName_civilian"] call _setGravestoneType;
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
