#include "macros.hpp"

DEBUG_PRINT_LOG("initting squad markers")

f_var_hideSquadMarkers = false;

f_var_squadMarker_colourChoices =
[
    'Red',
    'Orange',
    'Yellow',
    'Green',
    'Blue',
    'Cyan',
    'Magenta',
    'Pink',
    'Purple',
    'White',
    'Light Grey',
    'Dark Grey',
    'Black',
    'Grey',
    'Brown',
    'Khaki'
];

f_var_squadMarker_colourData =
[
	RED,
	ORANGE,
	YELLOW,
	GREEN,
	BLUE,
	CYAN,
	MAGENTA,
	PINK,
	PURPLE,
	WHITE,
	LIGHTGREY,
	DARKGREY,
	BLACK,
	GREY,
	BROWN,
	KHAKI
];

f_var_squadMarker_iconChoices =
[
	'<Automatic>',
	'Helicopter',
	'Anti-air',
	'Armor',
	'Artillery',
	'Headquarters',
	'Infantry',
	'Repair',
	'Mechanized Inf.',
	'Medic',
	'Mortar',
	'Motorized Inf.',
	'Naval',
	'Plane',
	'Recon',
	'Supply',
	'Unknown',
	'Anti-Tank',
	'Heavy Anti-Tank',
	'Heavy Weapons',
	'EOD',
	'Special Forces'
];

f_var_squadMarker_iconData =
[
	"",
	HELO,
	ANTIAIR,
	ARMOR,
	ARTILLERY,
	HQ,
	INFANTRY,
	REPAIR,
	MECHINF,
	MEDIC,
	MORTAR,
	MOTORINF,
	NAVAL,
	PLANE,
	RECON,
	SUPPLY,
	UNKNOWN,
	ANTITANK, 
	HEAVYANTITANK,
	HEAVYWEAPONS,
	EOD,
	SPECIALFORCES
];


CLIENT_ONLY;


#ifdef ENABLE_SQUAD_MARKERS

[] call f_fnc_beginSquadMarkers;

#else

if (true) exitWith { DEBUG_PRINT_LOG("[SquadMarkers] init_component was called but ENABLE_SQUAD_MARKERS is not set.") };

#endif
