/* --------------------------------------------------

SGBD 1 - GRUPO 9

Script DDL - Criação das tabelas do projeto

----------------------------------------------------- */

CREATE TYPE loot_grade AS ENUM('primary','resource','barrel','basic','military','tool','food','elite');
CREATE TYPE item_type as ENUM('ranged', 'resource','melee','clothes','component','consumable','tea');
CREATE TYPE fire_mode as ENUM('single','auto','semi-auto','full-auto','charged-fire','pump');
CREATE TYPE equipment_slot as ENUM('face','head','chest','chest-armour','feet','legs','leg-armour','whole-body','hands');
CREATE TYPE status_type as ENUM('health','mining','woodcutting','radiation','scrap');
CREATE TYPE node_type as ENUM('sulfur', 'stone', 'metal', 'tree', 'cactus');
CREATE TYPE ENUM_STATUS AS ENUM ('HIGH','MEDIUM', 'LOW');
CREATE TYPE monument_tier AS ENUM('basic','military','elite');
CREATE TYPE enemy_grade AS ENUM('scientist', 'outpost-scientist', 'heavy-scientist', 'bandit');
CREATE TYPE ENUM_BOOLEAN AS ENUM('true','false');

CREATE TABLE IF NOT EXISTS Structures (
  id INTEGER NOT NULL,
  combat_enemy BOOLEAN,
  name VARCHAR(30) NOT NULL,
  CONSTRAINT pk_Structures PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Monuments (
  id SERIAL PRIMARY KEY UNIQUE,
  monumentSize INT,
  lootGrade monument_tier,
  name VARCHAR(30) UNIQUE
);

CREATE TABLE IF NOT EXISTS Backpack (
  ownerID INT,
  id SERIAL PRIMARY KEY UNIQUE,
  slot01 INT,
  slot02 INT,
  slot03 INT,
  slot04 INT,
  slot05 INT,
  slot06 INT,
  slot07 INT,
  slot08 INT,
  slot09 INT,
  slot10 INT
);

CREATE TABLE IF NOT EXISTS Characters (
  id SERIAL primary key unique NOT NULL,
  name VARCHAR(100) NOT NULL,
  type VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS PlayerCharacters (
  hydration INTEGER NOT NULL,
  poisoned INTEGER NOT NULL,
  hunger INTEGER NOT NULL,
  equipedItems1 INTEGER,
  equipedItems2 INTEGER,
  equipedItems3 INTEGER,
  equipedItems4 INTEGER,
  equipedItems5 INTEGER,
  backpack INTEGER
)INHERITS (Characters);


CREATE TABLE IF NOT EXISTS NPCs (
  isAgressive BOOLEAN NOT NULL,
  typeNpc VARCHAR(30) NOT NULL,
  grade VARCHAR(30) NOT NULL
)INHERITS (Characters);

CREATE TABLE IF NOT EXISTS Items (
	id SERIAL primary key unique NOT NULL,
	maxStackSize int NOT NULL,
	itemName varchar(100) NOT NULL,
	itemType item_type NOT NULL,
	lootGrade loot_grade
);

CREATE TABLE IF NOT EXISTS MeleeWeapons (
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

CREATE TABLE IF NOT EXISTS RangedWeapons (
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
)INHERITS (items);

CREATE TABLE IF NOT EXISTS Consumables (
	instantHeal int,
	healOverTime int,
	hidrationYield int,
	bleedingYield int,
	radiationYield int,
	poisonYield int,
	hungerYield int,
	vomitChance numeric(4,2)
)INHERITS(items);

CREATE TABLE IF NOT EXISTS Teas (
	statusUpgradeType varchar(15),
	upgradePercentage numeric(4,2)
)INHERITS(Consumables);

CREATE TABLE IF NOT EXISTS Clothing (
	coldResistance numeric(4,2),
	radResistance numeric(4,2),
	explosionResistance numeric(4,2),
	meleeResistance numeric(4,2),
	rangedResistance numeric(4,2),
	biteResistance numeric(4,2),
	equipmentSlot equipment_slot,
	wetResistance numeric(4,2)
)INHERITS(items);

CREATE TABLE IF NOT EXISTS Resources (
	isPrimary boolean NOT NULL,
	isRefinable boolean NOT NULL
)INHERITS (items);

CREATE TABLE IF NOT EXISTS ResourceNodes (
  id SERIAL PRIMARY KEY UNIQUE,
  nodeType node_type,
  maxYield INT,
  durabilityDamage FLOAT
);

CREATE TABLE IF NOT EXISTS LootCrates (
  item_quantity INT,
  id SERIAL PRIMARY KEY UNIQUE,
  grade loot_grade
);

CREATE TABLE IF NOT EXISTS loot_crate_instance(
  id serial primary key unique,
  loot_grade loot_grade,
  item1_id int,
  item2_id int,
  item3_id int,
  item4_id int,
  item5_id int,
  item6_id int,
  item7_id int
);

CREATE TABLE IF NOT EXISTS Party (
  id INTEGER NOT NULL,
  character INTEGER NOT NULL,
  capacity INTEGER NOT NULL,
  CONSTRAINT pk_Party PRIMARY KEY(id),
  CONSTRAINT fk_Party_Characters FOREIGN KEY (character) REFERENCES Characters(id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS instancedItem (
	id serial primary key,
	itemID int,
	itemDurability float,
	quantity int
);

ALTER TABLE instancedItem ADD FOREIGN KEY (itemID) REFERENCES Items(id);