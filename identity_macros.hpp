
#define BEGIN_IDENTITIES f_identities_registry = []
#define BEGIN_IDENTITY_ASSIGNMENT f_identity_assignment = []

#define ADD_IDENTITY_TO_REGISTRY(NAME) f_identities_registry pushBack #NAME

#define FACTION_IDENTITY_VAR(FACTION) CONCAT(f_identity_assignment_,FACTION)

#define SET_FACTION_IDENTITY(FACTION,IDENTITY) FACTION_IDENTITY_VAR(FACTION) = #IDENTITY
#define GET_FACTION_IDENTITY(FACTION) FACTION_IDENTITY_VAR(FACTION)
#define GET_FACTION_IDENTITY_DYNAMIC(FACTION) (missionNamespace getVariable ["f_identity_assignment_" + FACTION, ""])

#define GET_FACES_FOR_IDENTITY_DYNAMIC(FACTION) (missionNamespace getVariable ["f_identities_" + FACTION + "_faces", [""]])
#define GET_SPEAKERS_FOR_IDENTITY_DYNAMIC(FACTION) (missionNamespace getVariable ["f_identities_" + FACTION + "_speakers", [""]])

#define IDENTITY_VAR(NAME) CONCAT(f_identities_,NAME)

#define SPEAKERS(NAME) CONCAT(IDENTITY_VAR(NAME),_speakers)
#define FACES(NAME) CONCAT(IDENTITY_VAR(NAME),_faces)

#define CREATE_IDENTITY(NAME,SPEAKERARRAY,FACEARRAY) \
 	IDENTITY_VAR(NAME) = []; \
 	SPEAKERS(NAME) = SPEAKERARRAY; \
	FACES(NAME) = FACEARRAY; \
	ADD_IDENTITY_TO_REGISTRY(NAME)
