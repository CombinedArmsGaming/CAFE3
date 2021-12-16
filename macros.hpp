#include "startup\configuration\internals\configMacros.hpp"


#define IS_HC (!(hasInterface or isServer))
#define IS_CLIENT (hasInterface or {IS_HC})
#define IS_PLAYER (hasInterface)


// Debugging utilities
#ifdef ENABLE_DEBUG

// Clientside only.
#define DEBUG_PRINT_CHAT(STRING) player sideChat STRING;
#define DEBUG_FORMAT1_CHAT(STRING, F1) player sideChat format [STRING, str F1];
#define DEBUG_FORMAT2_CHAT(STRING, F1, F2) player sideChat format [STRING, str F1, str F2];
#define DEBUG_FORMAT3_CHAT(STRING, F1, F2, F3) player sideChat format [STRING, str F1, str F2, str F3];

// Client and serverside.
#define DEBUG_PRINT_LOG(STRING) if (IS_HC) then {("FROM HC: "+STRING) remoteExec ["diag_log", 2];} else {diag_log STRING};
#define DEBUG_FORMAT1_LOG(STRING, F1) if (IS_HC) then {(format ["FROM HC: "+STRING, str F1]) remoteExec ["diag_log", 2];} else {diag_log format [STRING, str F1]};
#define DEBUG_FORMAT2_LOG(STRING, F1, F2) if (IS_HC) then {(format ["FROM HC: "+STRING, str F1, str F2]) remoteExec ["diag_log", 2];} else {diag_log format [STRING, str F1, str F2]};
#define DEBUG_FORMAT3_LOG(STRING, F1, F2, F3) if (IS_HC) then {(format ["FROM HC: "+STRING, str F1, str F2, str F3]) remoteExec ["diag_log", 2];} else {diag_log format [STRING, str F1, str F2, str F3]};

#else

// Clientside only.
#define DEBUG_PRINT_CHAT(STRING)
#define DEBUG_FORMAT1_CHAT(STRING, F1)
#define DEBUG_FORMAT2_CHAT(STRING, F1, F2)
#define DEBUG_FORMAT3_CHAT(STRING, F1, F2, F3)

// Client and serverside.
#define DEBUG_PRINT_LOG(STRING)
#define DEBUG_FORMAT1_LOG(STRING, F1)
#define DEBUG_FORMAT2_LOG(STRING, F1, F2)
#define DEBUG_FORMAT3_LOG(STRING, F1, F2, F3)

#endif


// General utility
#define CONCAT(s1,s2) s1##s2
#define CONCAT3(s1,s2,s3) s1##s2##s3
#define CONCAT4(s1,s2,s3,s4) s1##s2##s3##s4
#define CURLY(VARIABLE) {##VARIABLE##}
#define SQUARE(VARIABLE) [##VARIABLE##]
#define STRING(VARIABLE) #VARIABLE

// Startup convenience macros
#define RUN_ONLY_ONCE_ASYNC(PATH,VAR) if (isNil #VAR) then { VAR = [] execVM PATH; };
#define RUN_FUNC_ONCE_ASYNC(FUNC) if (isNil #CONCAT(f_script,FUNC)) then { CONCAT(f_script,FUNC) = [] spawn FUNC; };

#define RUN_ONLY_ONCE(PATH,VAR) if (isNil #VAR) then { VAR = true; call compile preprocessFile PATH; };
#define RUN_FUNC_ONCE(FUNC) if (isNil #CONCAT(f_script,FUNC)) then { CONCAT(f_script,FUNC) = true; [] call FUNC; };

#define IS_TRUE(VAR) ((!isNil #VAR) and {VAR})
#define EXISTS(VAR) ((!isNil #VAR) and {!(isNull VAR)})

#define SERVER_ONLY if (!isServer) exitWith {}
#define CLIENT_ONLY if !IS_CLIENT exitWith {}
#define LOCAL_ONLY(obj) if !(local obj) exitWith {}

#define SERVER_WARN(MESSAGE) if (!isServer) then { DEBUG_PRINT_LOG(MESSAGE) }
#define CLIENT_WARN(MESSAGE) if !IS_CLIENT then { DEBUG_PRINT_LOG(MESSAGE) }
#define LOCAL_WARN(OBJ, MESSAGE) if !(local OBJ) then { DEBUG_PRINT_LOG(MESSAGE) }

#define SERVER_ONLY_WARN(MESSAGE) if (!isServer) exitWith { DEBUG_PRINT_LOG(MESSAGE) }
#define CLIENT_ONLY_WARN(MESSAGE) if !IS_CLIENT exitWith { DEBUG_PRINT_LOG(MESSAGE) }
#define LOCAL_ONLY_WARN(OBJ, MESSAGE) if !(local OBJ) exitWith { DEBUG_PRINT_LOG(MESSAGE) }

#define WAIT_UNTIL_SETTINGS_READY() \
waitUntil                           \
{                                   \
    IS_TRUE(f_var_allSettingsReady) \
};

#define WAIT_UNTIL_MISSION_STARTED()                 \
waitUntil                                            \
{                                                    \
    (time > 0) and {IS_TRUE(f_var_allSettingsReady)} \
};


#define WAIT_UNTIL_PLAYER_EXISTS()  \
if (isNull player) then             \
{                                   \
    waitUntil                       \
    {                               \
        !isNull player              \
    };                              \
                                    \
}

#define TRANSFER_TO_SERVER(FUNC,ARGS) \
    if (!isServer) exitWith { ARGS remoteExec [#FUNC,2]; }; \
    ARGS spawn FUNC

#define TRANSFER_TO_HC(FUNC,ARGS) \
    _shouldExit = [#FUNC, ARGS] call f_fnc_tryRunOnHeadlessClient; \
    if (_shouldExit) exitWith {}; \
    ARGS spawn FUNC

#define RUN_ON_SERVER(FUNC,ARGS) if (!isServer) exitWith { ARGS remoteExec [#FUNC,2]; }
#define RUN_ON_HC(FUNC,ARGS) \
    _shouldExit = [#FUNC, ARGS] call f_fnc_tryRunOnHeadlessClient; \
    if (_shouldExit) exitWith {}

#define RUN_LOCAL_TO(OBJ,FUNC,ARGS) \
if (isNull OBJ) exitwith { DEBUG_FORMAT1_LOG("Tried calling %1 local to a null object.",FUNC) }; \
if (!(local OBJ)) exitWith { ARGS remoteExec [#FUNC,OBJ]; }

#define RUN_AS_ASYNC(FUNC) if (!canSuspend) exitWith { _this spawn FUNC }


#define INIT_COMPONENT(COMPNAME) RUN_ONLY_ONCE_ASYNC('components\COMPNAME\init_component.sqf',CONCAT(f_script_init_,COMPNAME))
#define LOAD_GLOBALS(COMPNAME) RUN_ONLY_ONCE('components\COMPNAME\globals.sqf',CONCAT(f_script_globals_,COMPNAME))

#define FULL_KILL_LOG_KEY_SERVER 'f_var_killTracking_##KILL_LOG_NAME##'
#define FULL_KILL_LOG_KEY_CLIENT 'f_var_killTracking_##KILL_LOG_NAME##_received'
