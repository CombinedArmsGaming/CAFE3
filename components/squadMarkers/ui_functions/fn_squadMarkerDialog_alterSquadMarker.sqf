#include "macros.hpp"

SERVER_ONLY;

params ["_group", "_squadName", "_colourName", "_iconName"];

_groupId = groupId _group;
_side = side _group;
_sideName = [_side] call f_fnc_sideToString;

if !(_squadName isEqualTo "") then
{
    _group setGroupIdGlobal [_squadName];
    _groupId = _squadName;
};

if !(_colourName isEqualTo "") then
{
    _colour = switch (toUpper _colourName) do
    {
        case ("RED"): {RED};
        case ("ORANGE"): {ORANGE};
        case ("YELLOW"): {YELLOW};
        case ("GREEN"): {GREEN};
        case ("BLUE"): {BLUE};
        case ("CYAN"): {CYAN};
        case ("MAGENTA"): {MAGENTA};
        case ("PINK"): {PINK};
        case ("PURPLE"): {PURPLE};
        case ("WHITE"): {WHITE};
        case ("LIGHT GREY"): {LIGHTGREY};
        case ("DARK GREY"): {DARKGREY};
        case ("BLACK"): {BLACK};
        case ("GREY"): {GREY};
        case ("BROWN"): {BROWN};
        case ("KHAKI"): {KHAKI};

        default {DEFAULT_COLOUR};

    };

    SET_SQUAD_COLOUR(_groupId,_colour);

};

if !(_iconName isEqualTo "") then
{
    _icon = switch (_iconName) do
    {
        case ("Helicopter"): {HELO};
        case ("Anti-air"): {ANTIAIR};
        case ("Armor"): {ARMOR};
        case ("Artillery"): {ARTILLERY};
        case ("Headquarters"): {HQ};
        case ("Infantry"): {INFANTRY};
        case ("Repair"): {REPAIR};
        case ("Mechanized Inf."): {MECHINF};
        case ("Medic"): {MEDIC};
        case ("Mortar"): {MORTAR};
        case ("Motorized Inf."): {MOTORINF};
        case ("Naval"): {NAVAL};
        case ("Plane"): {PLANE};
        case ("Recon"): {RECON};
        case ("Supply"): {SUPPLY};
        case ("Unknown"): {UNKNOWN};

        default {UNKNOWN};

    };

    SET_SQUAD_ICON(_groupId,_icon);

};
