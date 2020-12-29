/*

    Define identities via the structure below to configure custom soldier faces, voices and names:

    Define array of voices.
        _speakers = ["male05engb","male04engb","male03engb","male02engb","male01engb"];

    Define array of faces:
        _faces = ["WhiteHead_27","WhiteHead_07","WhiteHead_18","WhiteHead_21","WhiteHead_13"];

    Define names in one of two ways:

        1. Use a name set from Arma's CfgWorlds:
            _names = "EnglishMen";

        2. Create your own array of custom names:
            _forenames = ["Bob", "Joe", "Dave"];
            _surnames = ["Bobson", "Johnson", "Davis"];
            _names = [_forenames, _surnames];

    Create the identity, where the first parameter is the identity name ("brit" below).
        CREATE_IDENTITY(brit,_speakers,_faces,_names);

    Finally, assign the identity to a faction in identityAssignment.sqf

    By default, this file only has faces and voices supported by default, unmodded Arma.
    To find more faces and voices from mods, you can place units in the editor.
    Play the mission, aim at the unit and type this into the console in the ESC menu:
        [face cursorObject, speaker cursorObject]

    You can choose units to ignore this identity replacement process.  To do so, paste this line into their init box:
        this setVariable ["f_var_ignoreFactionIdentity", true, true];

*/

BEGIN_IDENTITIES;


// British
_speakers = ["male05engb","male04engb","male03engb","male02engb","male01engb"];
_faces = ["WhiteHead_09","AfricanHead_01","WhiteHead_12","WhiteHead_19","WhiteHead_14","Barklem","WhiteHead_04","GreekHead_A3_08","WhiteHead_11","WhiteHead_16","WhiteHead_02","AfricanHead_03","Sturrock","WhiteHead_08","WhiteHead_05","WhiteHead_15","WhiteHead_10","WhiteHead_07","WhiteHead_13","AfricanHead_02","WhiteHead_20","WhiteHead_21","WhiteHead_01","WhiteHead_17","GreekHead_A3_09","WhiteHead_06"];
_names = "EnglishMen";

CREATE_IDENTITY(british,_speakers,_faces,_names);


// American
_speakers = ["male12eng","male02eng","male07eng","male08eng","male05eng","male04eng","male01eng","male06eng","male03eng","male10eng","male09eng","male11eng"];
_faces = ["Sturrock","WhiteHead_20","WhiteHead_16","WhiteHead_02","GreekHead_A3_07","WhiteHead_08","GreekHead_A3_06","WhiteHead_03","WhiteHead_07","Barklem","WhiteHead_17","WhiteHead_12","WhiteHead_18","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_15","GreekHead_A3_08","GreekHead_A3_09","GreekHead_A3_05","AfricanHead_02","AfricanHead_03","WhiteHead_14","WhiteHead_21","WhiteHead_19","WhiteHead_06","WhiteHead_01","WhiteHead_04","WhiteHead_05","AfricanHead_01","WhiteHead_13"];
_names = "EnglishMen";

CREATE_IDENTITY(american,_speakers,_faces,_names);


// French
_speakers = ["male02fre","male01fre","male03fre"];
_faces = ["Sturrock","WhiteHead_20","WhiteHead_16","WhiteHead_02","GreekHead_A3_07","WhiteHead_08","GreekHead_A3_06","WhiteHead_03","WhiteHead_07","Barklem","WhiteHead_17","WhiteHead_12","WhiteHead_18","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_15","GreekHead_A3_08","GreekHead_A3_09","GreekHead_A3_05","AfricanHead_02","AfricanHead_03","WhiteHead_14","WhiteHead_21","WhiteHead_19","WhiteHead_06","WhiteHead_01","WhiteHead_04","WhiteHead_05","AfricanHead_01","WhiteHead_13"];

_forenames = ["Thomas", "Nicolas", "Julien", "Quentin", "Maxime", "Antoine", "Clement", "Pierre", "Lucas", "Florian", "Guillaume", "Valentin", "Jérémy"];
_surnames = ["Mercier", "Bernard", "Durand", "Dubois", "Moreau", "Blanc", "Laurent", "Michel", "Roux", "Girard", "Fournier", "Lambert"];
_names = [_forenames, _surnames];

CREATE_IDENTITY(french,_speakers,_faces,_names);


// Greek
_speakers = ["male02gre","male05gre","male04gre","male01gre","male06gre","male03gre"];
_faces = ["GreekHead_A3_06","GreekHead_A3_04","Ioannou","GreekHead_A3_05","GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_09","GreekHead_A3_03","GreekHead_A3_08","Mavros","GreekHead_A3_07"];
_names = "GreekMen";

CREATE_IDENTITY(greek,_speakers,_faces,_names);


// Iranian
_speakers = ["male02per","male03per","male01per"];
_faces = ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"];
_names = "TakistaniMen";

CREATE_IDENTITY(iranian,_speakers,_faces,_names);


// Asian
_speakers = ["male01chi","male02chi","male03chi"];
_faces = ["AsianHead_A3_04","AsianHead_A3_07","AsianHead_A3_01","AsianHead_A3_05","AsianHead_A3_03","AsianHead_A3_02"];
_names = "ChineseMen";

CREATE_IDENTITY(asian,_speakers,_faces,_names);


// Russian
_speakers = ["male03rus","male02rus","male01rus"];
_faces = ["AsianHead_A3_07","WhiteHead_14","WhiteHead_06","WhiteHead_12","WhiteHead_30","Sturrock","LivonianHead_3","LivonianHead_10","WhiteHead_08","RussianHead_4","LivonianHead_1","LivonianHead_5","AsianHead_A3_01","WhiteHead_21","WhiteHead_17","RussianHead_3","WhiteHead_19","WhiteHead_02","WhiteHead_04","WhiteHead_09","LivonianHead_6","WhiteHead_10","WhiteHead_03","AsianHead_A3_04","LivonianHead_2","LivonianHead_9","WhiteHead_18","WhiteHead_16","WhiteHead_15","WhiteHead_07","AsianHead_A3_05","WhiteHead_11","LivonianHead_4","RussianHead_1","AsianHead_A3_03","AsianHead_A3_02","WhiteHead_01","LivonianHead_7","WhiteHead_13","RussianHead_5","AsianHead_A3_06","WhiteHead_05"];
_names = "RussianMen";

CREATE_IDENTITY(russian,_speakers,_faces,_names);


// Tanoan
_speakers = ["male02engfre","male01engfre"];
_faces = ["TanoanHead_A3_05","TanoanHead_A3_08","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_01","TanoanHead_A3_04"];
_names = "TanoanMen";

CREATE_IDENTITY(tanoan,_speakers,_faces,_names);


// Polish
_speakers = ["male03pol","male01pol","male02pol"];
_faces = ["WhiteHead_10","WhiteHead_03","WhiteHead_08","WhiteHead_15","LivonianHead_10","WhiteHead_13","WhiteHead_14","WhiteHead_04","LivonianHead_7","LivonianHead_2","WhiteHead_02","Sturrock","WhiteHead_21","LivonianHead_6","WhiteHead_07","WhiteHead_01","WhiteHead_20","WhiteHead_18","WhiteHead_05","LivonianHead_9","LivonianHead_8","WhiteHead_16","WhiteHead_11","LivonianHead_3","WhiteHead_17","LivonianHead_1","WhiteHead_12","WhiteHead_30","WhiteHead_09","WhiteHead_06"];
_names = "EnochMen";

CREATE_IDENTITY(polish,_speakers,_faces,_names);
