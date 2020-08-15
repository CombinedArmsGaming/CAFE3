#define LOOTBOX_VAR(NAME) CONCAT(f_lootbox_,NAME)
#define LOOTBOX_VAR_DYNAMIC(NAME) (missionNamespace getVariable [format ["f_lootbox_%1", NAME], []])

#define WHITE 100
#define GREEN 20
#define BLUE 10
#define PURPLE 2
#define ORANGE 1

#define LOOT_BOX "lootBox"
#define LOOT_SINGLE "singleItem"
#define LOOT_MULTIPLE "multipleItems"
#define LOOT_GROUP "itemGroup"
#define LOOT_LIST "lootList"

#define ITEMTYPE_ITEM "normalItem"
#define ITEMTYPE_BACKPACK "backpack"

#define CREATE_LOOTBOX(NAME) LOOTBOX_VAR(NAME) = [LOOT_BOX, []]

#define RANGE(MIN,MAX) [MIN, MAX]
#define BIASED_RANGE(MIN,MID,MAX) [MIN, MID, MAX];

// Single items, can be found in any loot construct
#define ITEM(ENT) [LOOT_SINGLE, ENT, ITEMTYPE_ITEM]
// Multiple identical items, quantity can be an integer or [min, max].
#define ITEMS(ENT,QUANTITIES) [LOOT_MULTIPLE, ENT, QUANTITIES, ITEMTYPE_ITEM]

// For when you want nothing to appear.
#define EMPTY() [LOOT_SINGLE, "", ITEMTYPE_ITEM]

// Single backpack, can be found in any loot construct
#define BACKPACK(ENT) [LOOT_SINGLE, ENT, ITEMTYPE_BACKPACK]
// Multiple identical backpacks, quantity can be an integer or [min, max] or [min, mid, max].
#define BACKPACKS(ENT,QUANTITIES) [LOOT_MULTIPLE, ENT, QUANTITIES, ITEMTYPE_BACKPACK]

#define ADD_TO_LOOTBOX(BOXNAME,ENT) (LOOTBOX_VAR(BOXNAME) select 1) pushBack ENT

// Different items grouped together.  For example, weapon grouped with ammo.  This is the base behaviour of a lootbox.
#define LOOTGROUP() [LOOT_GROUP, []]
#define ADD_TO_LOOTGROUP(GROUP,ENT) (GROUP select 1) pushBack ENT

// A list in which random objects are selected, based on rarity.
#define LOOTLIST(QUANTITIES) [LOOT_LIST, [], QUANTITIES]
#define ADD_TO_LOOTLIST(LIST,ENT,RARITY) (LIST select 1) pushBack [ENT, RARITY]

// Shortcut to have multiple of the same group or list.
#define MULTIPLE(ENT,QUANTITIES) [LOOT_LIST, [[ENT, WHITE]], QUANTITIES]

// Shortcut to define a chance of an entity appearing or not.
#define CHANCE_OF(ENT,RARITY) [LOOT_LIST, [[ENT,RARITY],[EMPTY(),WHITE]], 1]
