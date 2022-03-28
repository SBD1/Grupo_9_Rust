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
CREATE TYPE monument_tier AS ENUM('0','1','2','3');
CREATE TYPE enemy_grade AS ENUM('scientist', 'outpost-scientist', 'heavy-scientist', 'bandit');
CREATE TYPE ENUM_BOOLEAN AS ENUM('true','false');

CREATE TABLE IF NOT EXISTS Maps ( 
    id SERIAL PRIMARY KEY UNIQUE,
    mapID int UNIQUE
);

CREATE TABLE IF NOT EXISTS Structures ( 
  structureID INTEGER NOT NULL,
  monument VARCHAR(100) NOT NULL,
  CONSTRAINT pk_Structures PRIMARY KEY(structureID)
);

CREATE TABLE IF NOT EXISTS Monuments (
    monumentSize INT,
    id SERIAL PRIMARY KEY UNIQUE,
    lootGrade monument_tier,
    enemyGrade enemy_grade,
    regions VARCHAR(5),
    name VARCHAR(10) UNIQUE
);

CREATE TABLE IF NOT EXISTS Region ( 
    name VARCHAR(30),
    coordinates int,
    biome VARCHAR(30),
    dangerLevel SMALLINT,
    monument VARCHAR(30),
    FOREIGN KEY (monument) REFERENCES Monuments(name) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS HaveMapRegion ( 
  mapID INTEGER NOT NULL UNIQUE,
  coordinates INTEGER NOT NULL,
  CONSTRAINT pk_HaveMapRegion PRIMARY KEY(mapID,coordinates),
  CONSTRAINT fk_mapID_HaveMapRegion FOREIGN KEY (mapID) REFERENCES Maps(mapID) ON DELETE RESTRICT,
  CONSTRAINT fk_coordinates_HaveMapRegion FOREIGN KEY (coordinates) REFERENCES Structures(structureID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Climate ( 
  climateID int UNIQUE,
  temperature DECIMAL(4,1),
  event VARCHAR(30), 
  statusEffect VARCHAR(30),
  visibility ENUM_STATUS
);

CREATE TABLE IF NOT EXISTS Biomes ( 
  biomesID int UNIQUE,
  coordinates int,
  resourceAbundance boolean,
  resourceAvailability boolean,
  type VARCHAR(30),
  climate int
);

CREATE TABLE IF NOT EXISTS Flora ( 
  flora VARCHAR(30) NOT NULL,
  biomes INTEGER NOT NULL,
  CONSTRAINT pk_Flora PRIMARY KEY(flora),
  CONSTRAINT fk_Flora_Biomes FOREIGN KEY (biomes) REFERENCES Biomes(biomesID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Fauna ( 
  fauna VARCHAR(30) NOT NULL,
  biomes INTEGER NOT NULL,
  CONSTRAINT pk_Fauna PRIMARY KEY(fauna),
  CONSTRAINT fk_Fauna_Biomes FOREIGN KEY (biomes) REFERENCES Biomes(biomesID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Characters ( 
  charactersID INTEGER NOT NULL UNIQUE,
  name VARCHAR(100) NOT NULL,
  position INTEGER NOT NULL,
  characterModel VARCHAR(30) NOT NULL,
  climate INTEGER NOT NULL,
  type VARCHAR(30) NOT NULL,
  item VARCHAR(30) NOT NULL,
  CONSTRAINT pk_Characters PRIMARY KEY(charactersID),
  CONSTRAINT fk_Characters_Climate FOREIGN KEY (climate) REFERENCES Climate(climateID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS GatherYield ( 
  character INTEGER NOT NULL, 
  gatherYield VARCHAR(30) NOT NULL,
  CONSTRAINT pk_GatherYield PRIMARY KEY(character,gatherYield),
  CONSTRAINT fk_GatherYield_Characters FOREIGN KEY (character) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS EnterCombatCharacters ( 
  enterCombatCharactersID INTEGER NOT NULL,
  firstCharacter INTEGER NOT NULL,
  secondCharacter INTEGER NOT NULL,
  CONSTRAINT pk_EnterCombatCharacters PRIMARY KEY(enterCombatCharactersID),
  CONSTRAINT fk_EnterCombatCharacters_Characters_1 FOREIGN KEY (firstCharacter) REFERENCES Characters(charactersID) ON DELETE RESTRICT,
  CONSTRAINT fk_EnterCombatCharacters_Characters_2 FOREIGN KEY (secondCharacter) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS CombatLog ( 
  enterCombatCharacters INTEGER NOT NULL,
  indexLog INTEGER NOT NULL,
  CONSTRAINT pk_CombatLog PRIMARY KEY(enterCombatCharacters,indexLog),
  log VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Backpack (
    ownerID INT UNIQUE,
    id SERIAL PRIMARY KEY UNIQUE,
    avaliableSlots INT,
    slot SMALLINT,
    totalSlots SMALLINT
);

CREATE TABLE IF NOT EXISTS PlayerCharacters ( 
  charactersID INTEGER NOT NULL,
  hydration INTEGER NOT NULL,
  poisoned INTEGER NOT NULL,
  hunger INTEGER NOT NULL,
  type VARCHAR(30) NOT NULL,
  equipedItems1 INTEGER,
  equipedItems2 INTEGER,
  equipedItems3 INTEGER,
  equipedItems4 INTEGER,
  equipedItems5 INTEGER,
  backpack INTEGER NOT NULL,
  CONSTRAINT pk_PlayerCharacters PRIMARY KEY(charactersID),
  CONSTRAINT fk_PlayerCharacters_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID) ON DELETE RESTRICT,
  CONSTRAINT fk_PlayerCharacters_Backpack FOREIGN KEY (backpack) REFERENCES Backpack(ownerID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS RecruitableCharacters ( 
  charactersID INTEGER NOT NULL,
  specialization VARCHAR(30) NOT NULL,
  recruited ENUM_BOOLEAN NOT NULL,
  CONSTRAINT pk_RecruitableCharacters PRIMARY KEY(charactersID),
  CONSTRAINT fk_RecruitableCharacters_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS MainCharacter ( 
  charactersID INTEGER NOT NULL,
  owner INTEGER NOT NULL,
  CONSTRAINT pk_MainCharacter PRIMARY KEY(charactersID,owner),
  CONSTRAINT fk_MainCharacter_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS RespawnLocation (
    ownerID INT,
    id SERIAL PRIMARY KEY UNIQUE,
    description VARCHAR(300),
    timer INT,
    coordinateX VARCHAR(5),
    coordinateY VARCHAR(5)
);

CREATE TABLE IF NOT EXISTS NPCs ( 
  charactersID INTEGER NOT NULL,
  isAgressive ENUM_BOOLEAN NOT NULL,
  aggroRange VARCHAR(30) NOT NULL, 
  enemyGrade VARCHAR(30) NOT NULL,
  type VARCHAR(30) NOT NULL,
  CONSTRAINT pk_NPCs PRIMARY KEY(charactersID),
  CONSTRAINT fk_NPCs_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Animals ( 
  charactersID INTEGER NOT NULL,
  sound VARCHAR(100) NOT NULL,
  modelType VARCHAR(30) NOT NULL,
  CONSTRAINT pk_Animals PRIMARY KEY(charactersID),
  CONSTRAINT fk_Animals_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Scientists ( 
  charactersID INTEGER NOT NULL,
  hasDialogue ENUM_BOOLEAN NOT NULL,
  CONSTRAINT pk_Scientists PRIMARY KEY(charactersID),
  CONSTRAINT fk_Scientists_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS DialogueText ( 
  dialogue VARCHAR(100) NOT NULL,
  character INTEGER NOT NULL,
  CONSTRAINT pk_DialogueText PRIMARY KEY(dialogue),
  CONSTRAINT fk_DialogueText_Characters FOREIGN KEY (character) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Items (
	id SERIAL primary key unique NOT NULL,
	maxStackSize int NOT NULL,
	itemName varchar(100) NOT NULL,
	itemType item_type NOT NULL,	
	lootGrade loot_grade
);

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
)INHERITS (items);

CREATE TABLE IF NOT EXISTS Consumables(
	instantHeal int,
	healOverTime int,
	hidrationYield int,
	bleedingYield int,
	radiationYield int,
	poisonYield int,
	hungerYield int,
	vomitChance numeric(4,2)
)INHERITS(items);

CREATE TABLE IF NOT EXISTS Teas(
	statusUpgradeType varchar(15),
	upgradePercentage numeric(4,2)
)INHERITS(Consumables);

CREATE TABLE IF NOT EXISTS Clothing(
	coldResistance numeric(4,2),
	radResistance numeric(4,2),
	explosionResistance numeric(4,2),
	meleeResistance numeric(4,2),
	rangedResistance numeric(4,2),
	biteResistance numeric(4,2),
	equipmentSlot equipment_slot,
	wetResistance numeric(4,2)
)INHERITS(items);

CREATE TABLE IF NOT EXISTS Resources(
	isPrimary boolean NOT NULL,
	isRefinable boolean NOT NULL
)INHERITS (items);

CREATE TABLE IF NOT EXISTS ResourceNodes (
    id SERIAL PRIMARY KEY UNIQUE,
    nodeType node_type,
    maxYield INT,
    durabilityDamage FLOAT
);

CREATE TABLE IF NOT EXISTS ResourceNodesGenerateItems ( 
  resourceNodes INTEGER NOT NULL,
  item INTEGER NOT NULL,
  CONSTRAINT pk_ResourceNodesGenerateItems PRIMARY KEY(resourceNodes, item),
  CONSTRAINT fk_ResourceNodesGenerateItems_ResourceNodes FOREIGN KEY (resourceNodes) REFERENCES ResourceNodes(id) ON DELETE RESTRICT,
  CONSTRAINT fk_ResourceNodesGenerateItems_Items FOREIGN KEY (item) REFERENCES Items(id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS RegionsMonuments ( 
  name VARCHAR(30) NOT NULL,
  regionMonument VARCHAR(30) NOT NULL,
  CONSTRAINT pk_RegionsMonuments PRIMARY KEY(name, regionMonument),
  CONSTRAINT fk_RegionsMonuments_Monuments FOREIGN KEY (name) REFERENCES Monuments(name) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS LootCrates (
    quantifyOfItens INT,
    id SERIAL PRIMARY KEY UNIQUE,
    grade loot_grade
);

CREATE TABLE IF NOT EXISTS StructuresContainsLootCrates ( 
  structure INTEGER NOT NULL,
  lootCrates INTEGER NOT NULL,
  CONSTRAINT pk_StructuresContainsLootCrates PRIMARY KEY(structure, lootCrates),
  CONSTRAINT fk_StructuresContainsLootCrates_Structures FOREIGN KEY (structure) REFERENCES Structures(structureID) ON DELETE RESTRICT,
  CONSTRAINT fk_StructuresContainsLootCrates_LootCrates FOREIGN KEY (lootCrates) REFERENCES LootCrates(id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS Party ( 
  partyID INTEGER NOT NULL,
  character INTEGER NOT NULL,
  capacity INTEGER NOT NULL,
  CONSTRAINT pk_Party PRIMARY KEY(partyID),
  CONSTRAINT fk_Party_Characters FOREIGN KEY (character) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS instancedItem (
	id serial primary key,
	itemID int,
	itemDurability float,
	quantity int
);

ALTER TABLE instancedItem ADD FOREIGN KEY (itemID) REFERENCES Items(id);