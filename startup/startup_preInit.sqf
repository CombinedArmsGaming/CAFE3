// Ensure globals are run before preInit, so globals are available for preInit.
// Execution order is deliberate below, to give us leeway in case we develop a client preInit that relies on server globals somehow.

if (hasInterface) then
{
	#include "components\globals\clientGlobals.sqf"
};

if (isServer) then
{
	#include "components\globals\serverGlobals.sqf"
};

if (hasInterface) then
{
	#include "configuration\groups\clientConfigGroup_preInit.sqf"
};

if (isServer) then
{
	#include "configuration\groups\serverConfigGroup_preInit.sqf"
};