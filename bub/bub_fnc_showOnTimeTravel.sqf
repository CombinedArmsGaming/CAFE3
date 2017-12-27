params ["_toShow"];

if (isServer) then 
{ 
    _shows = missionNamespace getVariable ["toShow", []];
	_shows pushBack _toShow;
	missionNamespace setVariable ["toShow", _shows];
	
	_toShow setPos ((getPos _toShow) vectorAdd [0,0,-100]);
};