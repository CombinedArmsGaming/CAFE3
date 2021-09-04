#include "macros.hpp"

CLIENT_ONLY;

params ["_anchor"];

private _shouldSeeAnchor = (player getVariable ["f_var_isZeus", false]);

_anchor hideObject (!_shouldSeeAnchor);
