
#define BEGIN_IDENTITIES f_identities_registry = []
#define BEGIN_IDENTITY_ASSIGNMENT f_identity_assignment = []

#define ADD_IDENTITY_TO_REGISTRY(NAME) f_identities_registry pushBack #NAME

#define SET_FACTION_IDENTITY(FACTION,IDENTITY) f_identity_assignment pushBack [#FACTION,#IDENTITY] 
#define GET_FACTION_IDENTITY(FACTION) f_identity_assignment select { (_x select 0) == FACTION} select 0 select 1

#define IDENTITY_VAR(NAME) CONCAT(f_identities_,NAME)

#define SPEAKERS(NAME) CONCAT(IDENTITY_VAR(NAME),_speakers)
#define FACES(NAME) CONCAT(IDENTITY_VAR(NAME),_faces)

#define CREATE_IDENTITY(NAME,SPEAKERARRAY,FACEARRAY)\
 	IDENTITY_VAR(NAME) = [];\
 	SPEAKERS(NAME) = SPEAKERARRAY;\
	FACES(NAME) = FACEARRAY;\
	ADD_IDENTITY_TO_REGISTRY(NAME)
