
Gearscript configuration - README file.

Use ACE Arsenal to generate a loadout code (using the "EXPORT" button).  You can paste the loadout codes into the gear files to use them as unit loadouts.
By default, the "gear_blufor.sqf" file contains an example gearscript for a "NATO 2035" faction.

Commands are available to add randomisation to units, reduce loadout effort and also set-up re-supply crates.

-------------------------------------------------

Available commands FOR UNIT LOADOUTS:

CREATE_LOADOUT(UNIT_NAME,<ACE Arsenal code>);
-   Assigns the ACE Arsenal loadout to the unit.
    For example, you can create a Rifleman loadout and assign it to the unit-name "rif".  The rif class will now be available at Loadout Lockers in-game.

COPY_LOADOUT(TO,FROM);
-   Copies a loadout from one unit-type to another unit-type.  Useful if you want to give the same loadout to FTLs and SLs, etc.

ADD_HAT(UNIT_NAME,"Hat Classname");
-   Adds a hat to the unit's "random hats" list.  When a unit is given this loadout, they will recieve a random hat from the list.
    You can get a Classname for the hat by clicking it in ACE Arsenal and pressing CTRL+C to copy it.  You can then press CTRL+V to paste it into this file.
    You must create the loadout using the CREATE_LOADOUT command before using this command.
    You can add many hats to the list by using this command many times.

ADD_UNIFORM(UNIT_NAME,"Uniform Classname");
ADD_VEST(UNIT_NAME,"Vest Classname");
ADD_BACKPACK(UNIT_NAME,"Backpack Classname");
-   These all work the same as the ADD_HAT command.  The only difference is that they randomise uniforms, vests and backpacks.

COPY_ADDONS(TO,FROM);
-   Copies all of the "random lists" from one unit-type to another unit-type.
    This is useful for adding random uniforms, hats etc to all of your units without having to do lots of repeated work.
-   For example:
        Create a Rifleman loadout with a lot of good randomisation options.
        Create a new Anti-tank loadout.
        COPY_ADDONS(lat,rif);
        The Anti-tank loadout now has all of the Rifleman's randomisation.

COPY_HATS(TO,FROM);
COPY_VESTS(TO,FROM);
COPY_BACKPACKS(TO,FROM);
-   Copies only the hat, vest or backpack randomisation from one unit-type to another one.
    This is useful in situations where you only want to copy one type of randomisation from another unit-type.

CLEAR_HATS(UNIT_NAME);
-   Empties the "random hats" list for the unit.
    This is useful for copying addons from other unit-types, and then changing parts o them around.
-   For example:
        Create a Rifleman loadout with a lot of good randomisation options.
        Create a new Machinegunner loadout.
        COPY_ADDONS(rif,lmg);
        The Machinegunner now has all of the Rifleman's randomisations.
        CLEAR_HATS(lmg);
        ADD_HAT(lmg,"H_Bandanna_cbr");
        All Machinegunners now have bandanas, but they still have random uniforms etc.

CLEAR_UNIFORMS(UNIT_NAME);
CLEAR_VESTS(UNIT_NAME);
CLEAR_BACKPACKS(UNIT_NAME);
-   These all work the same as the CLEAR_HATS command.  The only difference is that they empty "random lists" for uniforms, vests and backpacks.

CLEAR_ADDONS(UNIT_NAME);
-   Empties all of the "random lists" for the unit type at the same time.  Just like using all of the CLEAR_* commands at once.

ADD_VARIANT(UNIT_NAME,<ACE Arsenal code>);
-   Advanced feature.  Adds alternative loadouts to the unit-type.  The loadout will now be randomly chosen between the two.
    You must create the first loadout using the CREATE_LOADOUT command before using this command.
    Randomisation options apply across all variant loadouts.
-   For example:
    Use ACE Arsenal to create a Rifleman loadout with an AK-47 rifle.
    CREATE_LOADOUT(rif,<ACE Arsenal code>);
    Use ACE Arsenal to create a different Rifleman loadout with an M-16 rifle.
    ADD_VARIANT(rif,<ACE Arsenal code>);
    All riflemen will now randomly have an AK-47 or M-16 rifle.

PUT_GUN_IN_GUNBAG(UNIT_NAME,<contents>)
-   Allows the backpack of the given unit to be turned into an ACE gunbag, with the given contents placed inside.
    The contents can be:
    -   ACE Arsenal code:
        This must be a full ACE Arsenal export.  Not just the part with the weapon.
        An example of this exists in the default BLUFOR 'sniper' loadout.
    -   Weapon config class-name:
        An example of this exists in the default INDFOR 'sniper' loadout.
        You can get the class-name of any weapon by clicking on it in ACE arsenal and then pressing CTRL+C (gets copied to clipboard).
        There are advanced weapon classes which have scopes, bipods etc pre-applied.  You can find them in the CfgWeapons config.  If you don't know how to find these, it may be better to use the ACE Arsenal approach.

-------------------------------------------------

Available commands for editing UNIT LOADOUTS:

These commands can cause OVERLOADED LOADOUTS.  
This means that units may start with more items than they can technically carry, and if they drop any items they will not be able to pick them up again.
It's always better to use ACE Arsenal to design and edit your loadouts.  Use these commands with care.

ADD_ITEM_TO_UNIFORM(UNIT_NAME,"Item Name");
ADD_ITEMS_TO_UNIFORM(UNIT_NAME,"Item Name",AMOUNT);
-   Add an item to the unit's uniform.  If the uniform is full, it will be overloaded with this item.
    This command only supports regular items and magazines.  It does not support weapons, clothing items etc.

ADD_ITEM_TO_VEST(UNIT_NAME,"Item Name");
ADD_ITEMS_TO_VEST(UNIT_NAME,"Item Name",AMOUNT);
-   Add an item to the unit's vest.  If the vest is full, it will be overloaded with this item.
    This command only supports regular items and magazines.  It does not support weapons, clothing items etc.   

ADD_ITEM_TO_BACKPACK(UNIT_NAME,"Item Name");
ADD_ITEMS_TO_BACKPACK(UNIT_NAME,"Item Name",AMOUNT);
-   Add an item to the unit's backpack.  If the backpack is full, it will be overloaded with this item.
    This command only supports regular items and magazines.  It does not support weapons, clothing items etc.

REMOVE_ITEM_FROM_LOADOUT(UNIT_NAME,"Item Name");
-   Removes every item of this kind from the unit's clothing (uniform, vest, backpack).
    Does not remove clothing, held weapons, magazines from weapons etc.

ADD_MAP(UNIT_NAME);
REMOVE_MAP(UNIT_NAME);
-   Adds or removes the "ItemMap" object for the given unit.

ADD_GPS(UNIT_NAME);
-   Adds the "ItemGPS" object for the given unit.

ADD_TERMINAL(UNIT_NAME,"Item Name");
REMOVE_TERMINAL(UNIT_NAME);
-   Adds or removes a terminal item for the given unit (GPS, UAV terminal etc).

ADD_COMPASS(UNIT_NAME);
REMOVE_COMPASS(UNIT_NAME);
-   Adds or removes the "ItemCompass" object for the given unit.

ADD_WATCH(UNIT_NAME);
-   Adds the "ItemWatch" object for the given unit.

ADD_WATCH_ITEM(UNIT_NAME,"Item Name");
REMOVE_WATCH(UNIT_NAME);
-   Adds or removes a watch item for the given unit (Watch, Chemical detector etc).

ADD_NVG(UNIT_NAME,"Item Name");
REMOVE_NVG(UNIT_NAME);
-   Adds or removes night-vision goggles for the given unit.

-------------------------------------------------

Available commands FOR RE-SUPPLY CRATES:

CREATE_CRATE(NAME);
-   Create a re-supply crate with the given name.
    When in the editor, you can use "crate_NAME" to apply the loadout to a container.
-   For example:
    CREATE_CRATE(helicopter_resupply);
    A crate named helicopter_resupply now exists.
    In-editor, use the following line on a container:
    ["crate_helicopter_resupply", this, "blu_f"] call f_fnc_assignGear;
    The container now contains the helicopter_resupply items (for BLUFOR).

ADD_ITEMS_TO_CRATE(CRATE,"Item Name",AMOUNT);
-   Adds the item into the crate.  The number of items is given by AMOUNT.

ADD_RIFLE_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
-   Adds the primary weapon of the unit into the crate.  If the unit doesn't have a primary weapon, nothing will be added.

ADD_RIFLE_AMMO_TO_CRATE(CRATE,UNIT_NAME,AMOUNT);
-   Adds ammo for the unit's primary weapon into the crate.  If the unit doesn't have a magazine loaded into their weapon, nothing will be added.

ADD_RIFLE_GRENADES_TO_CRATE(CRATE,NAME,AMOUNT);
-   Adds ammo for the unit's grenade launcher into the crate.  If the unit doesn't have a grenade loaded into their weapon, nothing will be added.

ADD_PISTOL_TO_CRATE(CRATE,NAME,AMOUNT);
-   Adds the backup weapon of the unit into the crate.  If the unit doesn't have a backup weapon, nothing will be added.

ADD_PISTOL_AMMO_TO_CRATE(CRATE,NAME,AMOUNT);
-   Adds ammo for the unit's backup weapon into the crate.  If the unit doesn't have a magazine loaded into their weapon, nothing will be added.

ADD_LAUNCHER_TO_CRATE(CRATE,NAME,AMOUNT);
-   Adds the launcher weapon of the unit into the crate.  If the unit doesn't have a launcher, nothing will be added.

ADD_LAUNCHER_AMMO_TO_CRATE(CRATE,NAME,AMOUNT);
-   Adds ammo for the unit's launcher weapon into the crate.  If the unit doesn't have a rocket loaded into their launcher, nothing will be added.

ADD_BANDAGES_TO_CRATE(CRATE,AMOUNT);
-   Adds bandages into the crate.  This will be an auto-generated mixture of different bandage types.

ADD_SPLINTS_TO_CRATE(CRATE,AMOUNT);
-   Adds splints into the crate.

ADD_MEDS_TO_CRATE(CRATE,AMOUNT);
-   Adds medical auto-injectors into the crate. This will be an auto-generated mixture of different injectors.

ADD_BLOOD_TO_CRATE(CRATE,AMOUNT);
-   Adds blood-bags into the crate.  These will always be 1000ml bags of blood.

ADD_BACKPACKS_TO_CRATE(CRATE,NAME,AMOUNT);
-   Adds the backpack of the unit into the crate.  If the unit doesn't have a backpack, nothing will be added.

FINALIZE_CRATE(NAME);
-   Finishes the crate set-up.  This command currently does nothing, but advanced features may rely upon it in future.

-------------------------------------------------

INFO: All lines should end with a semi-colon (;).  When copy-pasting and adding new commands, make sure you do not accidentally delete or forget to add semi-colons.
For examples on how to use the gearscript system, see the "gear_blufor.sqf" file for a default "NATO 2035" loadout.  There are extra details in that file to explain things.
