/* Define identities via the strucutre below to configure custom soldier faces & voices:
 *
 * Define array of voices
 * _speakers = ["male05engb","male04engb","male03engb","male02engb","male01engb"];
 * 
 * Define array of faces
 * _faces = ["WhiteHead_27","WhiteHead_07","WhiteHead_18","WhiteHead_21","WhiteHead_13"];
 *
 * Create the identity, where the first parmeter is the identity name ("brit" below).
 * CREATE_IDENTITY(brit,_speakers,_faces);
 *
 * Finally assign the identity to a faction in identityAssignment.sqf
 */

BEGIN_IDENTITIES;

// Cor, it's the Empire, innit?
 _speakers = ["male05engb","male04engb","male03engb","male02engb","male01engb"];
 _faces = ["WhiteHead_27","WhiteHead_07","WhiteHead_18","WhiteHead_21","WhiteHead_13"];

CREATE_IDENTITY(brit,_speakers,_faces);

// FREEDOM MOTHERFUCKER, DO YOU SPEAK IT?
_speakers = ["male05engb","male04engb","male03engb","male02engb","male01engb"];
_faces = ["WhiteHead_27","WhiteHead_07","WhiteHead_18","WhiteHead_21","WhiteHead_13"];

CREATE_IDENTITY(yank,_speakers,_faces);

// Greek joke
_speakers = ["male05engb","male04engb","male03engb","male02engb","male01engb"];
_faces = ["WhiteHead_27","WhiteHead_07","WhiteHead_18","WhiteHead_21","WhiteHead_13"];

CREATE_IDENTITY(greek,_speakers,_faces);

// Gorilla joke
_speakers = ["male05engb","male04engb","male03engb","male02engb","male01engb"];
_faces = ["WhiteHead_27","WhiteHead_07","WhiteHead_18","WhiteHead_21","WhiteHead_13"];

CREATE_IDENTITY(monke,_speakers,_faces);

// War crime joke
_speakers = ["male05engb","male04engb","male03engb","male02engb","male01engb"];
_faces = ["WhiteHead_27","WhiteHead_07","WhiteHead_18","WhiteHead_21","WhiteHead_13"];

CREATE_IDENTITY(coward,_speakers,_faces);