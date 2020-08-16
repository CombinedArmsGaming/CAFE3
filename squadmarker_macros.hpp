
#define FACTION NONE
#define SQUADS f_dict_squadmarkers

#define RED	        [0.9,0,0,1]
#define ORANGE      [1,0.5,0,1]
#define YELLOW      [1,1,0,1]
#define GREEN       [0,1,0,1]
#define BLUE        [0.2,0.2,1,1]
#define CYAN        [0,1,1,1]
#define MAGENTA     [1,0,1,1]
#define PINK	    [1,0.3,0.4,1]
#define PURPLE      [0.5,0,1,1]
#define WHITE       [1,1,1,1]
#define LIGHTGREY   [0.7,0.7,0.7,1]
#define DARKGREY    [0.3,0.3,0.3,1]
#define BLACK	    [0,0,0,1]
#define GREY	    [0.5,0.5,0.5,1]
#define BROWN	    [0.5,0.25,0,1]
#define KHAKI	    [0.5,0.6,0.4,1]

#define DEFAULT_COLOUR [0.999,1,1,1]


#define HELO        "res\images\squadMarkers\squad_air.paa"
#define ANTIAIR     "res\images\squadMarkers\squad_antiair.paa"
#define ARMOR       "res\images\squadMarkers\squad_armor.paa"
#define ARTILLERY   "res\images\squadMarkers\squad_art.paa"
#define HQ          "res\images\squadMarkers\squad_hq.paa"
#define INFANTRY    "res\images\squadMarkers\squad_inf.paa"
#define REPAIR      "res\images\squadMarkers\squad_maint.paa"
#define MECHINF     "res\images\squadMarkers\squad_mech_inf.paa"
#define MEDIC       "res\images\squadMarkers\squad_med.paa"
#define MORTAR      "res\images\squadMarkers\squad_mortar.paa"
#define MOTORINF    "res\images\squadMarkers\squad_motor_inf.paa"
#define NAVAL       "res\images\squadMarkers\squad_naval.paa"
#define PLANE       "res\images\squadMarkers\squad_plane.paa"
#define RECON       "res\images\squadMarkers\squad_recon.paa"
#define SUPPLY      "res\images\squadMarkers\squad_supply.paa"
#define UNKNOWN     "res\images\squadMarkers\squad_unknown.paa"

#define GET_SQUAD(NAME) (allGroups param [(allGroups findIf {groupId _x isEqualTo #NAME}), grpNull])
#define GET_SQUAD_DYNAMIC(NAME) (allGroups param [(allGroups findIf {groupId _x isEqualTo NAME}), grpNull])

#define GET_SQUAD_ON_SIDE(NAME,SIDE) (allGroups param [(allGroups findIf {(groupId _x isEqualTo #NAME) and {side _x isEqualTo SIDE}}), grpNull])
#define GET_SQUAD_ON_SIDE_DYNAMIC(NAME,SIDE) (allGroups param [(allGroups findIf {(groupId _x isEqualTo NAME) and {side _x isEqualTo SIDE}}), grpNull])

#define SQUAD_VAL(VARNAME) STRING(CONCAT(f_var_squadMarker_,VARNAME))
#define SET_SQUAD_VAL(NAME,VALNAME,VALUE) GET_SQUAD(NAME) setVariable [SQUAD_VAL(VALNAME), VALUE, true]
#define SET_SQUAD_VAL_DIRECT(GROUP,VALNAME,VALUE) GROUP setVariable [SQUAD_VAL(VALNAME), VALUE, true]

#define SET_SQUAD_IMPORTANT(NAME,VALUE) \
        SET_SQUAD_VAL(NAME,Important,VALUE); \
        [GET_SQUAD(NAME)] call f_fnc_maintainImportantSquad

#define SET_SQUAD_IMPORTANT_DIRECT(GROUP,VALUE) \
        SET_SQUAD_VAL_DIRECT(GROUP,Important,VALUE); \
        [GROUP] call f_fnc_maintainImportantSquad

#define SET_SQUAD_VISIBILITY(NAME,VISIBLE) SET_SQUAD_VAL(NAME,Visible,VISIBLE)
#define SET_SQUAD_VISIBILITY_DIRECT(GROUP,VISIBLE) SET_SQUAD_VAL_DIRECT(GROUP,Visible,VISIBLE)

#define HIDE_SQUAD(NAME) SET_SQUAD_VISIBILITY(NAME,false)
#define HIDE_SQUAD_DIRECT(GROUP) SET_SQUAD_VISIBILITY_DIRECT(GROUP,false)

#define UNHIDE_SQUAD(NAME) SET_SQUAD_VISIBILITY(NAME,true)
#define UNHIDE_SQUAD_DIRECT(GROUP) SET_SQUAD_VISIBILITY_DIRECT(GROUP,true)

#define SET_SQUAD_ICON(NAME,ICON) SET_SQUAD_VAL(NAME,Icon,ICON)
#define SET_SQUAD_ICON_DIRECT(GROUP,ICON) SET_SQUAD_VAL_DIRECT(GROUP,Icon,ICON)

#define SET_SQUAD_COLOUR(NAME,COLOUR) SET_SQUAD_VAL(NAME,Colour,COLOUR)
#define SET_SQUAD_COLOUR_DIRECT(GROUP,COLOUR) SET_SQUAD_VAL_DIRECT(GROUP,Colour,COLOUR)

#define SET_SQUAD_SPECIALISTS(NAME,ARRAY) SET_SQUAD_VAL(NAME,Specialists,ARRAY)
#define SET_SQUAD_SPECIALISTS_DIRECT(GROUP,ARRAY) SET_SQUAD_VAL_DIRECT(GROUP,Specialists,ARRAY)

#define GET_SQUAD_VAL(GROUP,VALNAME,DEFAULT) GROUP getVariable [SQUAD_VAL(VALNAME),DEFAULT]

#define SQUAD_VISIBLE(GROUP) GET_SQUAD_VAL(GROUP,Visible,true)
#define SQUAD_COLOUR(GROUP) GET_SQUAD_VAL(GROUP,Colour,[])
#define SQUAD_ICON(GROUP) GET_SQUAD_VAL(GROUP,Icon,"")
#define SQUAD_NAME(GROUP) (groupId GROUP)
#define SQUAD_IS_IMPORTANT(GROUP) GET_SQUAD_VAL(GROUP,Important,false)
#define SQUAD_SPECIALISTS(GROUP) GET_SQUAD_VAL(GROUP,Specialists,[])

#define SQUAD_STATE_BACKUP_NAME(NAME) (format ["f_var_squadBackup_%1", NAME])
#define SQUAD_STATE_BACKUP(NAME) missionNamespace getVariable [SQUAD_STATE_BACKUP_NAME(NAME), objNull]
