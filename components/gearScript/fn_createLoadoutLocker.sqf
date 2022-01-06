#include "macros.hpp"

RUN_AS_ASYNC(f_fnc_createLoadoutLocker);

params ["_locker", "_faction"];

WAIT_UNTIL_MISSION_STARTED();
waitUntil { IS_TRUE(f_var_gearscript_loaded) };

if (_locker getVariable ["f_var_isLoadoutLocker", false] isEqualTo true) exitWith {};

_gearVariant = [_faction] call f_fnc_factionToSideName;

if (_gearVariant isEqualTo "") exitWith {};

if (IS_PLAYER) then
{
    _registry = LOADOUT_REGISTRY_DYNAMIC(_gearVariant);

    if (_registry isEqualTo []) exitWith {};

    _codeTemplate = "['%1', (_this select 1), '%2'] call f_fnc_assignGear;";

    {
        _xCaps = toUpper _x;

        if !(_xCaps isEqualTo "DEFAULT") then
        {
            _condition = "!(_this getVariable ['f_var_assignGear_running', false])";

            if (_xCaps isEqualTo "ZEUS") then
            {
                _condition = "!((_this getVariable ['f_var_assignGear_running', false]) or {!(_this getVariable ['f_var_isZeus', false])})";
            };

            _locker addAction
            [
                format ["<t color='#999999'>Take loadout:</t> <t color='#ff8800'>%1</t>", _xCaps],
                format [_codeTemplate, _x, _faction],
                nil,
                1.5,
                false,
                true,
                "",
                _condition,
                5
            ];
        };

    } forEach _registry;

};

_locker setVariable ["f_var_isLoadoutLocker", true];

if (isServer) then
{
    _bagType = switch (_gearVariant) do
    {
        case ("blufor"):      {"Land_TentSolar_01_folded_bluewhite_F"};
        case ("opfor"):       {"Land_TentSolar_01_folded_redwhite_F"};
        case ("indfor"):      {"Land_TentSolar_01_folded_olive_F"};
        case ("guerrilla"):   {"Land_TentSolar_01_folded_olive_F"};
        case ("civilian"):    {"Land_TentSolar_01_folded_sand_F"};
        default               {"RoadCone_L_F"};
    };

    _lockerBag = _bagType createVehicle [0,0,0];
    _lockerBag attachTo [_locker, [0,0,1]];

};
