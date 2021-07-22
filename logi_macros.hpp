
#define LOGI_VAR(NAME) CONCAT(f_logi_,NAME)
#define LOGIVIC_VAR(NAME,VAR) CONCAT3(LOGI_VAR(NAME),_,VAR)
#define LOGIVIC_VAR_DYNAMIC(NAME,VAR) (format ["f_logi_%1_%2", NAME, VAR])

#define LOGI_REGISTRY LOGI_VAR(registry)

#define BEGIN_LOGI_CONFIG LOGI_REGISTRY = []

#define GET_VAR(NAME,DEFAULT) (missionNamespace getVariable [#NAME, DEFAULT])
#define GET_OBJECT_VAR(OBJECT,NAME,DEFAULT) (OBJECT getVariable [#NAME, DEFAULT])
#define GET_VAR_DYNAMIC(VAR,DEFAULT) (missionNamespace getVariable [VAR, DEFAULT])
#define SET_VAR(NAME,VAL,GLOBAL) (missionNamespace setVariable [#NAME, VAL, GLOBAL])
#define SET_OBJECT_VAR(OBJECT,VAR,VALUE,GLOBAL) (OBJECT setVariable [VAR, VALUE, GLOBAL])

#define ADD_LOGI_TO_REGISTRY(NAME) LOGI_REGISTRY pushBack #NAME
#define IS_REGISTERED_LOGI(NAME) (NAME in GET_VAR(LOGI_REGISTRY,[]))

#define GET_LOGITYPE(VIC) GET_OBJECT_VAR(VIC,LOGI_VAR(type),"")
#define SET_LOGITYPE(VIC,TYPE) SET_OBJECT_VAR(VIC,LOGI_VAR(type),TYPE,true)

#define VEHICLES_VAR(NAME) LOGIVIC_VAR(NAME,Vics)
#define SET_VEHICLES(NAME,VICSARRAY) SET_VAR(LOGIVIC_VAR(NAME,Vics),VICSARRAY,false)
#define GET_VEHICLES(NAME) GET_VAR(LOGIVIC_VAR(NAME,Vics),[])
#define GET_VEHICLES_DYNAMIC(VAR) GET_VAR_DYNAMIC(LOGIVIC_VAR_DYNAMIC(VAR,Vics),[])
#define ADD_VEHICLE(NAME,VICTYPE,AMOUNT) GET_VAR(LOGIVIC_VAR(NAME,Vics),[]) pushBack [VICTYPE, AMOUNT]
#define ADD_VEHICLE_WITH_GEAR(NAME,VICTYPE,AMOUNT,GEAR) GET_VAR(LOGIVIC_VAR(NAME,Vics),[]) pushBack [VICTYPE, AMOUNT, GEAR]

#define ROLES_VAR(NAME) LOGIVIC_VAR(NAME,Roles)
#define SET_ROLES(NAME,ROLESARRAY) SET_VAR(LOGIVIC_VAR(NAME,Roles),ROLESARRAY,false)
#define GET_ROLES(NAME) GET_VAR(LOGIVIC_VAR(NAME,Roles),[])
#define GET_ROLES_DYNAMIC(VAR) GET_VAR_DYNAMIC(LOGIVIC_VAR_DYNAMIC(VAR,"Roles"),[])
#define ADD_ROLE(NAME,ROLE) GET_VAR(LOGIVIC_VAR(NAME,Roles),[]) pushBack ROLE

#define GROUPS_VAR(NAME) LOGIVIC_VAR(NAME,Groups)
#define SET_GROUPS(NAME,GROUPSARRAY) SET_VAR(LOGIVIC_VAR(NAME,Groups),GROUPSARRAY,false)
#define GET_GROUPS(NAME) GET_VAR(LOGIVIC_VAR(NAME,Groups),[])
#define ADD_GROUP(NAME,CALLSIGN) GET_VAR(LOGIVIC_VAR(NAME,Groups),[]) pushBack CALLSIGN

#define CREATE_LOGI_TYPE(NAME) \
    SET_ROLES(NAME,[]); \
    SET_GROUPS(NAME,[]); \
    SET_VEHICLES(NAME,[]); \
    ADD_LOGI_TO_REGISTRY(NAME)
