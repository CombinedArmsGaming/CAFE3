#include "macros.hpp"

CLIENT_ONLY;

params ["_target", "_sound", "_distance", "_pitch"];

if (!(cameraOn isEqualTo player) && {(toLower cameraView) isEqualTo "internal"}) then
{
    _target say3d [_sound, _distance, _pitch];
    _target say3d [_sound, _distance, _pitch];
}
else
{
    _target say3d [_sound, _distance, _pitch];
}
