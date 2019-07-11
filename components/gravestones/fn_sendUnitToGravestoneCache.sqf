#include "macros.hpp"

RUN_ON_SERVER(f_fnc_sendUnitToGravestoneCache,_this);

params ["_cacheEntry", "_cacheName"];

#define CACHE f_arr_gravestoneCache
#define VIP_CACHE f_arr_gravestoneCachePriority

if (_cacheName isEqualTo "VIP_CACHE") exitWith
{
	VIP_CACHE pushBack _cacheEntry;
};

if (_cacheName isEqualTo "CACHE") exitWith
{
	CACHE pushBack _cacheEntry;
};
