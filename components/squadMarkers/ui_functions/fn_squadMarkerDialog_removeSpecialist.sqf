#include "macros.hpp"

// Get involved eleemnts.
_display = findDisplay IDD_SQUADMARKER_DIALOG;

_availableRolesList = _display displayCtrl IDC_SQUADMARKER_DIALOG_AVAILABLELISTBOX;
_visibleRolesList = _display displayCtrl IDC_SQUADMARKER_DIALOG_VISIBLELISTBOX;

// Get selected role and name.
_selectedIdx = lbCurSel _visibleRolesList;

if (_selectedIdx < 0) exitWith {};

_selectedRole = _visibleRolesList lbData _selectedIdx;
_selectedText = _visibleRolesList lbText _selectedIdx;


// Move selected role to tne 'available' list.
_visibleRolesList lbDelete _selectedIdx;

_newIdx = _availableRolesList lbAdd _selectedText;
_availableRolesList lbSetData [_newIdx, _selectedRole];
