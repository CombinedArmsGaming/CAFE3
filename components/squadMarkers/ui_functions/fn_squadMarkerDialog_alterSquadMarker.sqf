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
        case "b_hq": {HQ};
        case "b_inf": {INFANTRY};
        case "b_sf": {SPECIALFORCES};
        case "b_supply": {SUPPLY};
        case "b_motor_inf": {MOTORINF};
        case "b_mortar": {MORTAR};
        case "b_maint": {REPAIR};
        case "b_eod": {EOD};
        case "b_med": {MEDIC};
        case "b_mech_inf": {MECHINF};
        case "b_armor": {ARMOR};
        case "b_recon": {RECON};
        case "b_air": {HELO};
        case "b_plane": {PLANE};
        case "b_art": {ARTILLERY};
        case "b_naval": {NAVAL};
        case "b_antiair": {ANTIAIR};
        case "b_antitank": {ANTITANK};
        case "b_heavyantitank": {HEAVYANTITANK};
        case "b_heavyweapons": {HEAVYWEAPONS};

        default {UNKNOWN};
        
    };

    SET_SQUAD_ICON(_groupId,_icon);

};
