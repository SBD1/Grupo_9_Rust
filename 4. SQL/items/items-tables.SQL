CREATE TABLE IF NOT EXISTS instancedItem (
	id serial primary key,
	itemID int,
	itemDurability float,
	quantity int
);

CREATE TABLE IF NOT EXISTS Items (
	id SERIAL primary key unique NOT NULL,
	maxStackSize int NOT NULL,
	itemName varchar(100) NOT NULL,
	itemType item_type NOT NULL,	
	lootGrade loot_grade
);

CREATE TABLE IF NOT EXISTS Resources(
	isPrimary boolean NOT NULL,
	isRefinable boolean NOT NULL
)INHERITS (items);

CREATE TABLE IF NOT EXISTS MeleeWeapons(
	attackRange int,
	headDamage int,
	chestDamage int,
	legDamage int,
	armsDamage int,
	treeGatherRate int,
	oreGatherRate int,
	fleshGatherRate int,
	canBeThrown boolean
)INHERITS (items);

CREATE TABLE IF NOT EXISTS RangedWeapons(
	attackRange int,
	headDamage int,
	chestDamage int,
	legDamage int,
	armsDamage int,
	accuracyModifier numeric(4,2),
	fireRate int,
	fireMode fire_mode,
	modSlots int,
	ammoCapacity int,
	recoil int
);

CREATE TABLE IF NOT EXISTS Clothing(
	coldResistance numeric(4,2),
	radResistance numeric(4,2),
	explosionResistance numeric(4,2),
	meleeResistance numeric(4,2),
	rangedResistance numeric(4,2),
	biteResistance numeric(4,2),
	equipmentSlot numeric(4,2),
	wetResistance numeric(4,2)
);

CREATE TABLE IF NOT EXISTS Components(
)INHERITS(items);

CREATE TABLE IF NOT EXISTS Consumables(
	instantHeal int,
	healOverTime int,
	hidrationYield int,
	bleedingYield int,
	radiationYield int,
	poisionYield int,
	hungerYield int,
	vomitChance numeric(4,2)
)INHERITS(items);

CREATE TABLE IF NOT EXISTS Teas(
	statusUpgradeType varchar(15),
	upgradePercentage numeric(4,2)
)INHERITS(Consumables);


ALTER TABLE instancedItem ADD FOREIGN KEY (itemID) REFERENCES Items(id);