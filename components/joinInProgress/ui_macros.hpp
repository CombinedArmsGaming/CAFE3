#include "../../ui_macros.hpp"
#include "\a3\ui_f\hpp\definecommongrids.inc"

#define IDD_GROUPPICKER_DIALOG 12145

#define IDC_GROUPPICKER_CURRENTSQUADTEXT 1003
#define IDC_GROUPPICKER_SQUADLIST 1500
#define IDC_GROUPPICKER_TELEPORTCHECKBOX 2500
#define IDC_GROUPPICKER_CANCELBUTTON 1601

#define IDC_GROUPPICKER_MAP 4506

#define IDC_GROUPPICKER_VERTICALBARRIER 4507
#define IDC_GROUPPICKER_LEFTBORDER 4508
#define IDC_GROUPPICKER_BOTTOMBORDER 4509
#define IDC_GROUPPICKER_RIGHTBORDER 4510

#define infoBoxAndMapHeight ((teleportGroupY - teleportGroupVerticalPadding) - infoBoxY)
#define groupInfoBoxAndBordersHeight (infoBoxAndMapHeight / 2)
#define groupInfoBoxHeight (groupInfoBoxAndBordersHeight - infoBoxOutlineWidth * 2)
#define groupMapHeight (infoBoxAndMapHeight - groupInfoBoxAndBordersHeight)

// Hardcode again to avoid messing with any other UIs that use this
#define GUI_GRID_X		(0)
#define GUI_GRID_Y		(0)
#define GUI_GRID_W		(0.025)
#define GUI_GRID_H		(0.04)
