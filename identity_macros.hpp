
#define BEGIN_IDENTITIES f_identities_registry = []
#define ADD_IDENTITY_TO_REGISTRY(NAME) f_identities_registry pushBack #NAME

//#define IDENTITY_VAR(NAME) CONCAT(f_identities_,NAME)


//#define SPEAKERS(NAME) CONCAT(IDENTITY_VAR(NAME),"speakers")


//#define FACES(NAME) CONCAT(IDENTITY_VAR(NAME),"faces")

#define CREATE_IDENTITY(NAME)\
	ADD_IDENTITY_TO_REGISTRY(NAME)

//#define SET_SIDE_IDENTITY(SIDE, IDENTITY)
// 	IDENTITY_VAR(NAME) = [];\
// 	FACES(NAME) = [];\
// 	SPEAKERS(NAME) = [];\