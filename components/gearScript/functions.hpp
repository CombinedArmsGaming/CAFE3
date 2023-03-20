class gearScript
{
    file = "components\gearScript";
    class addGogglesEventHandler{preInit=1};
    class addInsigniaMonitor{};
    class addItemToLoadoutContainer{};
    class addLinkedItemToLoadout{};
    class addMaxLoadEventHandler{preInit=1};
    class alterUnitMaxLoads{};
    class applyGunbag{};
    class applyLoadout{};
    class applyLoadoutModifications{};
    class assignGear{};
    class createLoadoutLocker{};
    class removeItemFromLoadout{};
    class removeLinkedItemFromLoadout{};
};

class gearScriptCrates
{
    file = "components\gearScript\crateSupport";
    class addBackpacksToCrate{};
    class addBandagesToCrate{};
    class addBloodToCrate{};
    class addItemsToCrate{};
    class addLauncherAmmoToCrate{};
    class addLauncherToCrate{};
    class addMedsToCrate{};
    class addPistolAmmoToCrate{};
    class addPistolToCrate{};
    class addRifleAmmoToCrate{};
    class addRifleGrenadesToCrate{};
    class addRifleToCrate{};
    class addSplintsToCrate{};
    class applyCrateModifications{};
};

class gearScript_zen
{
    file = "components\gearScript\zen";
    class zen_createSupplyCrate_followUpDialog{};
    class zen_createSupplyCrate_performAction{};
    class zen_createSupplyCrate{};
};

class gearScript_gunbag
{
    file = "components\gearScript\gunbag";
    class getWeaponStateFromClassName{};
    class setGunbagVariableFromArsenalExport{};
    class setGunbagVariableState{};
};
