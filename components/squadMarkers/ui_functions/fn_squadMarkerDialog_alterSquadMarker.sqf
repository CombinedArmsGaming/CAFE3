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
        case ("RED"):        {COLOUR_RED};
        case ("ORANGE"):     {COLOUR_ORANGE};
        case ("YELLOW"):     {COLOUR_YELLOW};
        case ("GREEN"):      {COLOUR_GREEN};
        case ("BLUE"):       {COLOUR_BLUE};
        case ("CYAN"):       {COLOUR_CYAN};
        case ("MAGENTA"):    {COLOUR_MAGENTA};
        case ("PINK"):       {COLOUR_PINK};
        case ("PURPLE"):     {COLOUR_PURPLE};
        case ("WHITE"):      {COLOUR_WHITE};
        case ("LIGHT GREY"): {COLOUR_LIGHTGREY};
        case ("DARK GREY"):  {COLOUR_DARKGREY};
        case ("BLACK"):      {COLOUR_BLACK};
        case ("GREY"):       {COLOUR_GREY};
        case ("BROWN"):      {COLOUR_BROWN};
        case ("KHAKI"):      {COLOUR_KHAKI};

        default {COLOUR_DEFAULT};

    };

    SET_SQUAD_COLOUR(_groupId,_colour);

};

if !(_iconName isEqualTo "") then
{
    _icon = switch (_iconName) do
    {
        case "b_hq":            {ICON_HQ};
        case "b_inf":           {ICON_INFANTRY};
        case "b_sf":            {ICON_SPECIALFORCES};
        case "b_supply":        {ICON_SUPPLY};
        case "b_motor_inf":     {ICON_MOTORINF};
        case "b_mortar":        {ICON_MORTAR};
        case "b_maint":         {ICON_REPAIR};
        case "b_eod":           {ICON_EOD};
        case "b_med":           {ICON_MEDIC};
        case "b_mech_inf":      {ICON_MECHINF};
        case "b_armor":         {ICON_ARMOR};
        case "b_recon":         {ICON_RECON};
        case "b_air":           {ICON_HELO};
        case "b_plane":         {ICON_PLANE};
        case "b_art":           {ICON_ARTILLERY};
        case "b_naval":         {ICON_NAVAL};
        case "b_antiair":       {ICON_ANTIAIR};
        case "b_antitank":      {ICON_ANTITANK};
        case "b_heavyantitank": {ICON_HEAVYANTITANK};
        case "b_heavyweapons":  {ICON_HEAVYWEAPONS};

        default {ICON_UNKNOWN};

    };

    SET_SQUAD_ICON(_groupId,_icon);

};
