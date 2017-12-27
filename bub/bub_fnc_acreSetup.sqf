// Courtesy of PabstMirror; https://www.reddit.com/r/arma/comments/3bpz0v/acre2_babel_help/csouhd9/

f_available_languages = [
["en", "English"],
["de", "German"],
["fr", "French"]
];
{
    _x call acre_api_fnc_babelAddLanguageType;
} forEach f_available_languages;

[] spawn {
    if (!hasInterface) exitWith {};
    if (player != player) then {waitUntil {player == player};};
    if (!alive player) then {waitUntil {alive player};};
	waitUntil {time > 2};

    _languagesPlayerSpeaks = player getVariable ["f_languages", []];

    switch (playerside) do {
    case west: {
            if (_languagesPlayerSpeaks isEqualTo []) then {_languagesPlayerSpeaks = ["en", "de"];};
        };
    case east: {
            if (_languagesPlayerSpeaks isEqualTo []) then {_languagesPlayerSpeaks = ["de"];};
        };
    case independent: {
            if (_languagesPlayerSpeaks isEqualTo []) then {_languagesPlayerSpeaks = ["en", "fr"];};
        };
    case civilian: {
            if (_languagesPlayerSpeaks isEqualTo []) then {_languagesPlayerSpeaks = ["en", "fr"];};
        };
	default {
			diag_log "my dude";
			hint "aaaaaaaaaaaa";
            if (_languagesPlayerSpeaks isEqualTo []) then {_languagesPlayerSpeaks = ["en", "de", "fr"];};
        };
    };
	
    _languagesPlayerSpeaks call acre_api_fnc_babelSetSpokenLanguages;
};
