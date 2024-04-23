class F
{

#include "aceActions\functions.hpp"
#include "aiBehaviour\functions.hpp"
#include "aiCache\functions.hpp"
#include "aiDriver\functions.hpp"
#include "briefing\functions.hpp"
#include "ceasefire\functions.hpp"
#include "downtime\functions.hpp"
#include "endings\functions.hpp"
#include "ftMemberMarkers\functions.hpp"
#include "gearScript\functions.hpp"
#include "gravestones\functions.hpp"
#include "identity\functions.hpp"
#include "joinInProgress\functions.hpp"
#include "killTracker\functions.hpp"
#include "logiVehicle\functions.hpp"
#include "lootBox\functions.hpp"
#include "mapClick\functions.hpp"
#include "miscClient\functions.hpp"
#include "miscShared\functions.hpp"
#include "radio\functions.hpp"
#include "respawn\functions.hpp"
#include "spawnNpcs\functions.hpp"
#include "squadMarkers\functions.hpp"
#include "viewDistanceEditor\functions.hpp"
#include "zeus_ui\functions.hpp"


}

class BIS
{
	class overrides
	{
		file = "components\miscShared";
		class moduleCivilianPresence{};
	};
};

class ace_medical_feedback
{
	class overrides
	{
		file = "components\downtime";
		class effectUnconscious{};
		class effectUnconscious_original
		{
			file = "z\ace\addons\medical_feedback\functions\fnc_effectUnconscious.sqf";
		};
	}
}

class ace_medical_status
{
	class overrides
	{
		file = "components\medical";
		class isInStableCondition{};
	}
};

class ace_gunbag
{
	class overrides
	{
		file = "components\gearscript\gunbag";
		class hasGunbag{};
	};
};


#if __has_include("\idi\acre\addons\main\stringtable.xml")
    class acre_ace_interact
    {
        class overrides
        {
            file = "components\radio\acre";
            class radioListChildrenActions{};
            class radioListChildrenActions_original
            {
                file = "idi\acre\addons\ace_interact\fnc_radioListChildrenActions.sqf";
            };
        }
    }
#endif

class ace_spectator
{
    class overrides
    {
        file = "components\respawn\ui_functions";
        class ui_handleKeyDown{};
    }
};
