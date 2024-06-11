#include "../macros.hpp"

CLIENT_ONLY;

private _slottingCode = [] call f_fnc_generateSlotting;

copyToClipboard _slottingCode;

["Slotting code was copied to your clipboard."] call zen_common_fnc_showMessage;