#define FACTION opfor

BEGIN_IDENTITIES;

CREATE_IDENTITY(opfor)

// Cor, it's the Empire, innit?
_speakers = ["male05engb","male04engb","male03engb","male02engb","male01engb"];

ADD_SPEAKERS(_speakers);

_faces = ["WhiteHead_27","WhiteHead_07","WhiteHead_18","WhiteHead_21","WhiteHead_13"];

ADD_FACES(_faces);
