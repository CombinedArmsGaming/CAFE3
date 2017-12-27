params ["_toDelete"];

if (isServer) then 
{ 
    _deletes = missionNamespace getVariable ["toDelete", []];
	_deletes pushBack _toDelete;
	missionNamespace setVariable ["toDelete", _deletes];
};