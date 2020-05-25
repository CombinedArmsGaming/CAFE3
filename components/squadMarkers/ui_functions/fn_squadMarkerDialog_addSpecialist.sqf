#include "macros.hpp"

// Get involved eleemnts.
_display = findDisplay IDD_SQUADMARKER_DIALOG;

_availableRolesList = _display displayCtrl IDC_SQUADMARKER_DIALOG_AVAILABLELISTBOX;
_visibleRolesList = _display displayCtrl IDC_SQUADMARKER_DIALOG_VISIBLELISTBOX;

// Get selected role and name.
_selectedIdx = lbCurSel _availableRolesList;

if (_selectedIdx < 0) exitWith {};

_selectedRole = _availableRolesList lbData _selectedIdx;
_selectedText = _availableRolesList lbText _selectedIdx;


// Move selected role to tne 'visible' list.
_availableRolesList lbDelete _selectedIdx;

_newIdx = _visibleRolesList lbAdd _selectedText;
_visibleRolesList lbSetData [_newIdx, _selectedRole];
