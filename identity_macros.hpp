
#define BEGIN_IDENTITIES f_identities_registry = []
#define BEGIN_IDENTITY_ASSIGNMENT f_identity_assignment = []

#define ADD_IDENTITY_TO_REGISTRY(NAME) f_identities_registry pushBack #NAME

#define FACTION_IDENTITY_VAR(FACTION) CONCAT(f_identity_assignment_,FACTION)

#define SET_FACTION_IDENTITY(FACTION,IDENTITY) FACTION_IDENTITY_VAR(FACTION) = #IDENTITY
#define GET_FACTION_IDENTITY(FACTION) FACTION_IDENTITY_VAR(FACTION)
#define GET_FACTION_IDENTITY_DYNAMIC(FACTION) (missionNamespace getVariable ["f_identity_assignment_" + FACTION, ""])

#define GET_FACES_FOR_IDENTITY_DYNAMIC(FACTION) (missionNamespace getVariable ["f_identities_" + FACTION + "_faces", [""]])
#define GET_SPEAKERS_FOR_IDENTITY_DYNAMIC(FACTION) (missionNamespace getVariable ["f_identities_" + FACTION + "_speakers", [""]])
#define GET_NAMES_FOR_IDENTITY_DYNAMIC(FACTION) (missionNamespace getVariable ["f_identities_" + FACTION + "_names", "Default"])

#define IDENTITY_VAR(NAME) CONCAT(f_identities_,NAME)

#define SPEAKERS(NAME) CONCAT(IDENTITY_VAR(NAME),_speakers)
#define FACES(NAME) CONCAT(IDENTITY_VAR(NAME),_faces)
#define NAMES(NAME) CONCAT(IDENTITY_VAR(NAME),_names)

#define CREATE_IDENTITY(NAME,SPEAKERARRAY,FACEARRAY,NAMESARRAY) \
 	IDENTITY_VAR(NAME) = []; \
 	SPEAKERS(NAME) = SPEAKERARRAY; \
    FACES(NAME) = FACEARRAY; \
	NAMES(NAME) = NAMESARRAY; \
	ADD_IDENTITY_TO_REGISTRY(NAME)
