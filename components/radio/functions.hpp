class radio_common
{
    file = "components\radio\common";
    class configureUnitRadios{};
    class getRadioChannelsForUnit{};
    class getRadioList{};
    class getRadioModInUse{};
    class registerPostGearscriptEventHandler{preInit=1;};
    class registerPreGearscriptEventHandler{preInit=1;};
    class removeRadiosFromLoadout{};
    class replaceUnitRadios{};
};
class radio_list
{
    file = "components\radio\radioList";
    class createRadioList{};
    class radioList_onSidebarClick{};
    class refreshRadioList{};
};

#include "acre\functions.hpp"
