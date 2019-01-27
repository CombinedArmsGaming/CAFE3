
#define FACTION NONE
#define SQUADS f_dict_squadmarkers

#define RED         [1,0,0,1]
#define ORANGE      [1,0.5,1,1]
#define YELLOW      [1,1,0,1]
#define GREEN       [0,1,0,1]
#define BLUE        [0,0,1,1]
#define CYAN        [0,1,1,1]
#define MAGENTA     [1,0,1,1]
#define PINK	    [1,0.3,0.4,1]
#define PURPLE      [0.5,0,1,1]
#define WHITE       [1,1,1,1]
#define LIGHTGREY   [0.7,0.7,0.7,1]
#define DARKGREY    [0.2,0.2,0.2,1]
#define BLACK	    [0,0,0,1]
#define GREY	    [0.5,0.5,0.5,1]
#define RED	        [0.9,0,0,1]
#define BROWN	    [0.5,0.25,0,1]
#define KHAKI	    [0.5,0.6,0.4,1]

#define DEFAULT_COLOUR [0.999,1,1,1]


#define AIR             "\A3\ui_f\data\Map\Markers\NATO\b_air.paa"
#define ANTIAIR         "\A3\ui_f\data\Map\Markers\NATO\b_antiair.paa"
#define ARMOR           "\A3\ui_f\data\Map\Markers\NATO\b_armor.paa"
#define ARTILLERY       "\A3\ui_f\data\Map\Markers\NATO\b_art.paa"
#define HQ              "\A3\ui_f\data\Map\Markers\NATO\b_hq.paa"
#define INFANTRY        "\A3\ui_f\data\Map\Markers\NATO\b_inf.paa"
#define INSTALLATION    "\A3\ui_f\data\Map\Markers\NATO\b_installation.paa"
#define MAINTENANCE     "\A3\ui_f\data\Map\Markers\NATO\b_maint.paa"
#define MECHINF         "\A3\ui_f\data\Map\Markers\NATO\b_mech_inf.paa"
#define MEDIC           "\A3\ui_f\data\Map\Markers\NATO\b_med.paa"
#define MORTAR          "\A3\ui_f\data\Map\Markers\NATO\b_mortar.paa"
#define MOTORINF        "\A3\ui_f\data\Map\Markers\NATO\b_motor_inf.paa"
#define NAVAL           "\A3\ui_f\data\Map\Markers\NATO\b_naval.paa"
#define PLANE           "\A3\ui_f\data\Map\Markers\NATO\b_plane.paa"
#define RECON           "\A3\ui_f\data\Map\Markers\NATO\b_recon.paa"
#define SERVICE         "\A3\ui_f\data\Map\Markers\NATO\b_service.paa"
#define SUPPORT         "\A3\ui_f\data\Map\Markers\NATO\b_support.paa"
#define UAV             "\A3\ui_f\data\Map\Markers\NATO\b_uav.paa"
#define UNKNOWN         "\A3\ui_f\data\Map\Markers\NATO\b_unknown.paa"


#define INIT_SQUADS() DICT_CREATE(SQUADS)

#define SQUAD_INDEX(NAME) (format ["%1_%2",#FACTION,#NAME])
#define SQUAD_INDEX_DYNAMIC(NAME,SIDE) (format ["%1_%2",SIDE,NAME])

#define SQUAD_VAR(NAME) DICT_GET(SQUADS,SQUAD_INDEX(NAME))
#define SQUAD_VAR_DYNAMIC(NAME,SIDE) DICT_GET(SQUADS,SQUAD_INDEX_DYNAMIC(NAME,SIDE))

#define NEW_SQUAD() [true,[],"",""]
#define MAKE_SQUAD_EDITABLE(NAME) DICT_SET(SQUADS,SQUAD_INDEX(NAME),NEW_SQUAD())
#define IS_SQUAD_EDITABLE(NAME) DICT_CONTAINS(SQUADS,SQUAD_INDEX(NAME))

#define SET_SQUAD_VISIBILITY(NAME,VISIBLE) (SQUAD_VAR(NAME)) set [0,VISIBLE]
#define HIDE_SQUAD(NAME) (SQUAD_VAR(NAME)) set [0,false]
#define UNHIDE_SQUAD(NAME) (SQUAD_VAR(NAME)) set [0,true]

#define SET_SQUAD_ICON(NAME,ICON) (SQUAD_VAR(NAME)) set [2,ICON]
#define SET_SQUAD_COLOUR(NAME,COLOUR) (SQUAD_VAR(NAME)) set [1,COLOUR]
#define SET_SQUAD_NAME(NAME,OVERRIDE) (SQUAD_VAR(NAME)) set [3,OVERRIDE]

#define SQUAD_VISIBLE(VAR) (VAR) select 0
#define SQUAD_COLOUR(VAR) (VAR) select 1
#define SQUAD_ICON(VAR) (VAR) select 2
#define SQUAD_NAME(VAR) (VAR) select 3
