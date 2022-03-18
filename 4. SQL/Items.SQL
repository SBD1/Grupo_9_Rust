CREATE TABLE IF NOT EXISTS Items (
	itemID SERIAL primary key unique NOT NULL,
	maxStackSize int NOT NULL,
	itemName varchar(100) NOT NULL,
	itemType varchar(20) NOT NULL,	
	craftable boolean NOT NULL,
	lootGrade int,
	compositionID int
);

CREATE TABLE IF NOT EXISTS Resources(
	itemID SERIAL primary key unique NOT NULL,
	maxStackSize int NOT NULL,
	itemName varchar(100) NOT NULL,
	lootGrade varchar(15) NOT NULL,
	itemType varchar(20) NOT NULL,	
	craftable boolean NOT NULL,
	isPrimary boolean NOT NULL,
	isRefinable boolean NOT NULL,
	compositionID int
);
CREATE TABLE IF NOT EXISTS MeleeWeapons(
	itemID SERIAL primary key unique NOT NULL,
	maxStackSize int NOT NULL,
	itemName varchar(100) NOT NULL,
	lootGrade varchar(15) NOT NULL,
	itemType varchar(20) NOT NULL,	
	craftable boolean NOT NULL,
	compositionID int,
	attackRange int,
	headDamage int,
	chestDamage int,
	legDamage int,
	armsDamage int,
	treeGatherRate int,
	oreGatherRate int,
	fleshGatherRate int,
	canBeThrown boolean
);
CREATE TABLE IF NOT EXISTS RangedWeapons(
	itemID SERIAL primary key unique NOT NULL,
	maxStackSize int NOT NULL,
	itemName varchar(100) NOT NULL,
	lootGrade varchar(15) NOT NULL,
	itemType varchar(20) NOT NULL,	
	craftable boolean NOT NULL,
	compositionID int,
	attackRange int,
	headDamage int,
	chestDamage int,
	legDamage int,
	armsDamage int,
	accuracyModifier numeric(4,2),
	fireRate int,
	fireMode varchar(25),
	modSlots int,
	ammoCapacity int,
	recoil int
);

CREATE TABLE IF NOT EXISTS Clothing(
	itemID SERIAL primary key unique NOT NULL,
	maxStackSize int NOT NULL,
	itemName varchar(100) NOT NULL,
	lootGrade varchar(15) NOT NULL,
	itemType varchar(20) NOT NULL,	
	craftable boolean NOT NULL,
	compositionID int,
	coldResistance numeric(4,2),
	radResistance numeric(4,2),
	explosionResistance numeric(4,2),
	meleeResistance numeric(4,2),
	rangedResistance numeric(4,2),
	biteResistance numeric(4,2),
	equipmentSlot numeric(4,2),
	wetResistance numeric(4,2)
);

CREATE TABLE IF NOT EXISTS Consumables(
	itemID SERIAL primary key unique NOT NULL,
	maxStackSize int NOT NULL,
	itemName varchar(100) NOT NULL,
	lootGrade varchar(15) NOT NULL,
	itemType varchar(20) NOT NULL,	
	craftable boolean NOT NULL,
	compositionID int,
	instantHeal int,
	healOverTime int,
	hidrationYield int,
	bleedingYield int,
	radiationYield int,
	poisionYield int,
	hungerYield int,
	vomitChance numeric(4,2)
);
CREATE TABLE IF NOT EXISTS Components(
	itemID SERIAL primary key unique NOT NULL,
	maxStackSize int NOT NULL,
	itemName varchar(100) NOT NULL,
	lootGrade varchar(15) NOT NULL,
	itemType varchar(20) NOT NULL,	
	craftable boolean NOT NULL,
	compositionID int
);
CREATE TABLE IF NOT EXISTS Teas(
	itemID SERIAL primary key unique NOT NULL,
	maxStackSize int NOT NULL,
	itemName varchar(100) NOT NULL,
	lootGrade varchar(15) NOT NULL,
	itemType varchar(20) NOT NULL,	
	craftable boolean NOT NULL,
	compositionID int,
	statusUpgradeType varchar(15),
	upgradePercentage numeric(4,2),
	instantHeal int,
	healOverTime int,
	hidrationYield int,
	bleedingYield int,
	radiationYield int,
	poisionYield int,
	hungerYield int,
	vomitChance numeric(4,2)
);




INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (1000,true,'resource', false,'Wood',False,'primary');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (1000,true,'resource', false,'Stone',False,'primary');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (1000,true,'resource', false,'Bone Fragments',False,'primary');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (1000,true,'resource', false,'Leather',False,'primary');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (1000,true,'resource', false,'Cloth',False,'primary');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (1000,true,'resource', false,'Scrap',False,'primary');

INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (100,true,'resource', false,'High Quality Metal Ore',true,'primary');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (500,true,'resource', false,'Animal Fat',true,'primary');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (500,true,'resource', false,'Crude Oil',true,'primary');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (1000,true,'resource', false,'Metal Ore',true,'primary');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (1000,true,'resource', false,'Sulfur Ore',true,'primary');

INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (100,false,'resource', true,'High Quality Metal',false,'resource');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (500,false,'resource', true,'Low Grade Fuel',false,'resource');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (1000,false,'resource', true,'Metal Fragments',false,'resource');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (1000,false,'resource', true,'Sulfur',false,'resource');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (1000,false,'resource', true,'Charcoal',false,'resource');
INSERT INTO Resources (maxStackSize,isPrimary, itemType, craftable,itemName,isRefinable,lootGrade) VALUES (1000,false,'resource', true,'Gunpowder',false,'resource');


CREATE TABLE IF NOT EXISTS ItemComposition (
	itemID int NOT NULL,
	compositionID int primary key unique NOT NULL,
	comp1 int NOT NULL,
	compquantity1 int NOT NULL,
	comp2 int,
	compquantity2 int,
	comp3 int,
	compquantity3 int,
	comp4 int,
	compquantity4 int
);


CREATE TABLE IF NOT EXISTS instancedItem (
	itemID int,
	instanceID int primary key,
	itemDurability float,
	quantity int,
	FOREIGN KEY (itemID) references Items(itemID)
);

ALTER TABLE Items
ADD FOREIGN KEY (compositionID) REFERENCES ItemComposition (compositionID);
ALTER TABLE ItemComposition ADD
FOREIGN KEY (itemID) REFERENCES Items(itemID),
ADD FOREIGN KEY (comp1) REFERENCES Items(itemID),
ADD FOREIGN KEY (comp2) REFERENCES Items(itemID),
ADD FOREIGN KEY (comp3) REFERENCES Items(itemID),
ADD FOREIGN KEY (comp4) REFERENCES Items(itemID);


